#!/usr/bin/env ruby
# encoding: utf-8

# Command-line tool to mail notes to self with Gmail.
#
# Install gems if you haven't:
#   gem install gmail active_support
#
# Configure:

TO = "henrik@nyh.se"
LOGIN = "robot@nyh.se"
PW = File.read(File.expand_path("~/.gmailpw")).chop

# Intended to be used with an Alfred.app extension like:
#
#   source ~/.rvm/scripts/rvm
#   ~/.bin/note_to_self.rb {query}

# https://github.com/nu7hatch/gmail
require "gmail"

# To fix Alfred.app encoding :(
require "active_support/all"

def init
  message = ARGV.first

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
