#!/usr/bin/env ruby

load File.dirname(__FILE__) + '/.rubyrc'
include RubyRC

require "rubygems"

# http://pablotron.org/software/wirble/
# Colorizes output, adds history etc.
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => e
  warn "Couldn't load Wirble: #{e}"
end

# Enable lambda prompts. http://twitter.com/acetoxy/status/26734736005
class IRB::Irb
  alias :original_prompt :prompt
  def prompt(prompt, ltype, indent, line_no)
    prompt = prompt.call if prompt.respond_to?(:call)
    original_prompt(prompt, ltype, indent, line_no)
  end
end

IRB.conf[:PROMPT][:SIMPLE].merge!(:PROMPT_I => lambda {
  PROMPT.call(">>")
})
IRB.conf[:PROMPT_MODE] = :SIMPLE
