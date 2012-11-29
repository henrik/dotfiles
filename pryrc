#!/usr/bin/env ruby

load File.expand_path("~/.rubyrc")
include RubyRC

Pry.config.prompt = [
  proc { PROMPT.call(">>") },
  proc { PROMPT.call(" *") }
]
