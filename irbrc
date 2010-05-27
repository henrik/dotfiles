#!/usr/bin/env ruby

require "rubygems"
require "ftools"

# http://pablotron.org/software/wirble/
# Colorizes output, adds history etc.
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

# Load .railsrc for Rails.
load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV'] 


# Quick benchmarking
# http://stackoverflow.com/questions/123494/whats-your-favourite-irb-trick/123834#123834
def bench(repetitions=100, &block)
  require 'benchmark'

  Benchmark.bmbm do |b|
    b.report {repetitions.times &block} 
  end
  nil
end
