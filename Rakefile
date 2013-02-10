DO_NOT_SYMLINK = %w[
  .gitignore
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


task :default => :install

desc "Install dotfiles."
task :install do
  Dir["*"].each do |file|
    source = File.join(Dir.pwd, file)
    basename = File.basename(source)
    next if DO_NOT_SYMLINK.include?(basename)

    target = File.expand_path("~/.#{basename}")

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
        next
      end
    end

    FileUtils.ln_s(source, target)
    info "Creating symlink: #{target} --> #{source}"
  end

  system "git submodule update --init"
end
