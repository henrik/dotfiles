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
# Uses asdf Ruby (not /usr/bin/ruby) so macOS prompts for folder access
# scoped to this process, rather than needing blanket Full Disk Access.
# The prompt will reappear after Ruby version upgrades, which is fine.

require "webrick"

PORT = 19998
HOME = Dir.home
DOWNLOADS_DIR = File.join(HOME, "Downloads")
SOUNDS_DIR = File.join(HOME, ".claude/sounds/SND01_sine")
DONE_SOUND = File.join(SOUNDS_DIR, "transition_up.wav")
ASK_SOUND = File.join(SOUNDS_DIR, "transition_down.wav")

server = WEBrick::HTTPServer.new(Port: PORT, BindAddress: "127.0.0.1", Logger: WEBrick::Log.new($stdout, WEBrick::Log::INFO))

server.mount_proc "/last-download" do |_req, res|
  latest = Dir.children(DOWNLOADS_DIR)
    .reject { it.start_with?(".") }
    .map { File.join(DOWNLOADS_DIR, it) }
    .sort_by { File.mtime(it) }
    .last

  if latest
    filename = File.basename(latest)
    puts "last-download: #{filename} (#{File.size(latest)} bytes)"
    safe_filename = filename.gsub('"', '\\"')
    res["Content-Disposition"] = "attachment; filename=\"#{safe_filename}\""
    res["Content-Type"] = "application/octet-stream"
    res.body = File.open(latest, "rb")
  else
    res.status = 404
    res.body = "No files in Downloads"
  end
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
