#!/usr/bin/env ruby

load File.dirname(__FILE__) + '/.rubyrc'
include RubyRC

Pry.config.prompt = [
  proc { PROMPT.call(">>") },
  proc { PROMPT.call(" *") }
]
