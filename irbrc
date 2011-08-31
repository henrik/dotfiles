#!/usr/bin/env ruby

require "rubygems"

# Require ftools in Ruby 1.8.
begin
  require "ftools"
rescue LoadError
end

# http://pablotron.org/software/wirble/
# Colorizes output, adds history etc.
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => e
  warn "Couldn't load Wirble: #{e}"
end

# Quick benchmarking
# http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834
def bench(repetitions=100, &block)
  require 'benchmark'

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block} 
  end
  nil
end

# Pre-defined hash and array to experiment with.
# http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123847#123847
HASH = { :one => 1, :two => 2, :three => 3, :four => 4, :five => 5 } unless defined?(HASH)
ARRAY = %w[one two three four five] unless defined?(ARRAY)

# Enable lambda prompts. http://twitter.com/acetoxy/status/26734736005
class IRB::Irb
  alias :original_prompt :prompt
  def prompt(prompt, ltype, indent, line_no)
    prompt = prompt.call if prompt.respond_to?(:call)
    original_prompt(prompt, ltype, indent, line_no)
  end
end

def rails_console?
  ($0 == 'irb' && ENV['RAILS_ENV']) ||  # Rails 2.
  $0 == 'script/rails'  # Rails 3.
end

# E.g.:
# 12:23:15 >> 
# DEV 12:23:15 >> 
IRB.conf[:PROMPT][:SIMPLE].merge!(:PROMPT_I => lambda {
  "#{[ (rails_console? ? Rails.env.first(3).upcase : nil), Time.now.strftime("%H:%M:%S") ].compact.join(' ')} >> "
})
IRB.conf[:PROMPT_MODE] = :SIMPLE


# Load .railsrc for Rails.
load File.dirname(__FILE__) + '/.railsrc' if rails_console?
