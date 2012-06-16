# encoding: utf-8

module Mod
end

class Super

  def hello
    puts "super hello"
  end

end

class SubOne < Super

  def hello
    puts "sub one hello"
    super
  end

end

class SubTwo < Super
end

SubOne.new.hello
