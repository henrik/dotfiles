DO_NOT_SYMLINK = %w[
  .gitignore
  config
  extras
  Rakefile
  README.markdown
]


def error(text)
  STDERR.puts "!  #{text}"
end

def info(text)
  STDOUT.puts "*  #{text}"
end

def info_rm(text)
  STDOUT.puts "x  #{text}"
end

def symlink(source, target)
  if File.symlink?(target)
    symlink_to = File.readlink(target)
    info_rm "Removing symlink #{target} --> #{symlink_to}" if symlink_to != source
    FileUtils.rm(target)
  elsif File.exist?(target)
    error "#{target} exists. Will not automatically overwrite a non-symlink. Overwrite (y/n)?"
    print "? "
    if STDIN.gets.match(/^y/i)
      info_rm "Removing #{target}."
      FileUtils.rm_rf(target)
    else
      return
    end
  end

  FileUtils.mkdir_p(File.dirname(target))
  FileUtils.ln_s(source, target)
  info "Creating symlink: #{target} --> #{source}"
end


task :default => :install

desc "Install dotfiles."
task :install do
  Dir["*"].each do |file|
    source = File.join(Dir.pwd, file)
    basename = File.basename(source)
    next if DO_NOT_SYMLINK.include?(basename)

    symlink(source, File.expand_path("~/.#{basename}"))
  end

  # Symlink `config` file by file rather than by directory, since there may be logs and such to keep outside version control, or whole apps outside version control.
  Dir["config/**/*"].select { |path| File.file?(path) }.each do |path|
    symlink(File.join(Dir.pwd, path), File.expand_path("~/.#{path}"))
  end
end
