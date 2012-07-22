#!/usr/bin/env ruby

# Complete rake tasks script for bash
# Save it somewhere and then add
# complete -C path/to/script -o default rake
# to your ~/.bashrc
# Nicholas Seckar <nseckar@gmail.com>
 
exit 0 unless File.file?(File.join(Dir.pwd, 'Rakefile'))
exit 0 unless /^rake(?:\s+([-\w]+))?\s*$/ =~ ENV["COMP_LINE"]
 
task_prefix = $1
 
tasks = `rake --tasks`.split("\n")[1..-1].collect {|line| line.split[1]}
tasks = tasks.select {|t| /^#{Regexp.escape task_prefix}/ =~ t} if task_prefix
puts tasks
exit 0

