#!/usr/bin/env ruby
# Command-line tool to mail notes to self with Gmail.
#
# Install gems if you haven't:
#   gem install gmail activesupport
#
# Configure:

TO = "henrik@nyh.se"
LOGIN = "robot@nyh.se"
PW = File.read(File.expand_path("~/.gmailpw")).chop

# Intended to be used with an Alfred.app extension like:
#
# ESCAPING: [ ] Spaces   [x] Backquotes [x] Double quotes [x] Backslashes
#           [ ] Brackets [ ] Semicolons [x] Dollars
#
#   source ~/.rvm/scripts/rvm
#   ~/.bin/note_to_self.rb "{query}"

begin
  # https://github.com/nu7hatch/gmail
  require "gmail"

  # To fix Alfred.app encoding :(
  require "active_support/all"
rescue LoadError => e
  puts e.message
  exit 1
end

def init
  message = ARGV.first

  # It's UTF-8, not ASCII-8BIT. Without this, it will look borked.
  message = message.dup
  message.force_encoding("UTF-8")

  # Alfred passes decomposed characters which cause the mail to silently fail.
  message = message.mb_chars.normalize

  note_to_self(message)
end

def note_to_self(message)
  log(message)  # So we have it even if it errors out.
  send_mail(LOGIN, PW, TO, message, message)
  puts "Sent: #{message}"
rescue StandardError => e
  puts "Error sending: #{e.class.name}: #{e.message}"
end

def log(message)
  File.open("/tmp/notes_to_self.txt", "a+") { |f| f.puts message }
end

def send_mail(login, pw, _to, _subject, _body)
  Gmail.connect!(login, pw) do |gmail|
    gmail.deliver do
      to _to
      subject _subject
      text_part do
        content_type 'text/plain; charset=UTF-8'
        body _body
      end
    end
  end
end

init
