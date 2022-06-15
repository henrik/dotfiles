#!/usr/bin/env ruby

# Command-line tool to mail notes to self with Gmail.
#
# Configure:

TO = "henrik@nyh.se"
LOGIN = "henrik@nyh.se"

# This needs to be a "Generated app password" to avoid the need for 2FA.
PW = File.read(File.expand_path("~/.gmailpw")).chop

# Intended to be used with an Alfred.app extension like:
#
# ESCAPING: [ ] Spaces   [x] Backquotes [x] Double quotes [x] Backslashes
#           [ ] Brackets [ ] Semicolons [x] Dollars
#
#   source ~/.rvm/scripts/rvm  # If you use RVM
#   source ~/.asdf/asdf.sh     # If you use asdf installed in .asdf
#   source $(/usr/local/bin/brew --prefix asdf)/asdf.sh  # If you use asdf installed via Homebrew
#   ~/.bin/note_to_self.rb "{query}"

require "net/imap"
require "net/smtp"

require "bundler/inline"
gemfile do
  source "https://rubygems.org"
  gem "gmail"
end

def init
  message = ARGV.first

  # It's UTF-8, not ASCII-8BIT. Without this, it will look borked.
  message = message.dup
  message.force_encoding("UTF-8")

  # Alfred passes decomposed characters which cause the mail to silently fail.
  message = message.unicode_normalize

  note_to_self(message)
end

def note_to_self(message)
  log(message)  # So we have it even if it errors out.
  subject = "[note to self] #{message}"
  send_mail(LOGIN, PW, TO, subject, message)
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
        content_type "text/plain; charset=UTF-8"
        body _body
      end
    end
  end
end

init
