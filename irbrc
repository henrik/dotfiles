#!/usr/bin/env ruby

load File.dirname(__FILE__) + '/.rubyrc'
include RubyRC

require "rubygems"

# Enable lambda prompts. http://twitter.com/acetoxy/status/26734736005
class IRB::Irb
  alias :original_prompt :prompt
  def prompt(prompt, ltype, indent, line_no)
    prompt = prompt.call if prompt.respond_to?(:call)
    original_prompt(prompt, ltype, indent, line_no)
  end
end

# Fixed-width prompt to avoid issues: https://ruby.social/@henrik/110694557615313865
IRB.conf[:PROMPT][:SIMPLE].merge!(
  PROMPT_I: -> { PROMPT.call(">>") },  # Initial prompt.
  PROMPT_S: -> { PROMPT.call(" %l") },  # String.
  PROMPT_C: -> { PROMPT.call(" >") },
  PROMPT_N: -> { PROMPT.call(" >") },
)
IRB.conf[:PROMPT_MODE] = :SIMPLE
