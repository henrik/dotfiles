#!/usr/bin/env ruby

load File.dirname(__FILE__) + '/.rubyrc'

include RubyRC

module PryRC
  # Prettily display the current object (e.g. "FileUtils" if
  # you do `cd FileUtils`).
  def self.pobj(obj)
    obj unless obj.to_s == "main"
  end
end

Pry.config.prompt = [
  proc { |obj| PROMPT.call("#{PryRC.pobj obj}>>") },
  proc { |obj| PROMPT.call("#{PryRC.pobj obj} *") }
]
