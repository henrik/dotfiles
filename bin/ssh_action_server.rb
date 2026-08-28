# A little server to run on a Mac host and perform actions on request e.g. from Claude via a port-forwarding SSH session like:
#
#     ssh -R 19998:localhost:19998 some-server
#
# Recommended to put in ~/.ssh/config:
#
#     Host some-server
#       RemoteForward 19998 localhost:19998
#
# Also works locally on the Mac host as the port is the same.
#
# Inspired by https://www.peonping.com/.
#
# Recommended to run via a launchd service on the Mac host; see the `launchd` subdirectory.
#
# Uses asdf Ruby (not /usr/bin/ruby) so macOS prompts for folder access scoped to this process, rather than needing blanket Full Disk Access.
# The prompt will reappear after Ruby version upgrades, which is fine.

require "webrick"
require "shellwords"

PORT = 19998
DOWNLOADS_DIR = File.join(Dir.home, "Downloads")
SOUNDS_DIR = File.join(Dir.home, ".claude/sounds/SND01_sine")
DONE_SOUND = File.join(SOUNDS_DIR, "transition_up.wav")
ASK_SOUND = File.join(SOUNDS_DIR, "transition_down.wav")

# Directories /file will serve from. Anything with a shell on the remote server can reach this port, so don't widen this to the whole home directory.
# No use allowing Dir.tmpdir (for screenshot preview thumbnails) as macOS blocks access.
ALLOWED_ROOTS = [
  DOWNLOADS_DIR,
  File.join(Dir.home, "Desktop"),
].filter_map { File.realpath(it) if File.directory?(it) }

# True for an iCloud placeholder: real size, no blocks on disk. This process can't trigger materialisation, so it would otherwise serve an empty file with a 200.
def dataless?(path)
  stat = File.stat(path)
  stat.size > 0 && stat.blocks == 0
end

def serve_file(res, path)
  if dataless?(path)
    puts "dataless: #{path}"
    res.status = 409
    res.body = "Not downloaded locally (iCloud placeholder). Open it on the Mac first, or run: brctl download #{path.shellescape}"
    return
  end

  filename = File.basename(path)
  puts "serving: #{filename} (#{File.size(path)} bytes)"
  safe_filename = filename.gsub('"', '\\"')
  res["Content-Disposition"] = "attachment; filename=\"#{safe_filename}\""
  res["Content-Type"] = "application/octet-stream"
  res.body = File.open(path, "rb")
end

# Resolves symlinks so the ALLOWED_ROOTS check can't be walked around, and because /var and /tmp are symlinks into /private on macOS.
def resolve(path)
  File.realpath(File.expand_path(path))
rescue SystemCallError
  nil
end

server = WEBrick::HTTPServer.new(Port: PORT, BindAddress: "127.0.0.1", Logger: WEBrick::Log.new($stdout, WEBrick::Log::INFO))

server.mount_proc "/last-download" do |_req, res|
  latest = Dir.children(DOWNLOADS_DIR)
    .reject { it.start_with?(".") }
    .map { File.join(DOWNLOADS_DIR, it) }
    .sort_by { File.mtime(it) }
    .last

  if latest
    serve_file(res, latest)
  else
    res.status = 404
    res.body = "No files in Downloads"
  end
end

server.mount_proc "/file" do |req, res|
  path = req.query["path"]
  resolved = path && resolve(path)

  if path.nil? || path.empty?
    res.status = 400
    res.body = "Missing ?path="
  elsif resolved.nil? || !File.file?(resolved)
    res.status = 404
    res.body = "No such file: #{path}"
  elsif ALLOWED_ROOTS.none? { resolved.start_with?("#{it}/") }
    res.status = 403
    res.body = "Not in an allowed directory (#{ALLOWED_ROOTS.join(", ")}): #{resolved}"
  else
    serve_file(res, resolved)
  end

  puts "file: #{res.status} #{path}" unless res.status == 200
end

server.mount_proc "/done" do |_req, res|
  puts "done"
  spawn("afplay", "-v", "0.5", DONE_SOUND)
  res.body = ""
end

server.mount_proc "/ask" do |_req, res|
  puts "ask"
  spawn("afplay", "-v", "0.5", ASK_SOUND)
  res.body = ""
end

trap("INT") { server.shutdown }
trap("TERM") { server.shutdown }
server.start
