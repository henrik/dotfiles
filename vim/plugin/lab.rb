# encoding: utf-8

module Mod
end

class Parent
  def hello
    puts "Hello from parent!"
  end
end

class ChildOne < Parent
  def hello
    puts "Hello from child 1!"
    super
  end
end

class ChildTwo < Parent
end

ChildOne.new.hello
