#!/usr/bin/env ruby

load File.expand_path("~/.rubyrc")
include RubyRC

Pry.config.prompt = Pry::Prompt.new("My custom prompt", "It's a great prompt.",
  [
    proc { PROMPT.call(">>") },
    proc { PROMPT.call(" *") },
  ],
)
