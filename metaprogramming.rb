class Test
  def one
    @var = 99
    two
  end

  def two
    puts @var
  end
end

t = Test.new
t.one

puts "Before the class definition, self = #{self}\n"
class Testing
  puts "In the definition of class Testing, self = #{self}"
  puts "Class of self = #{self.class}\n"
end
puts "After the class definition, self = #{self}"

class Tested
  @var = 99
  def self.value_of_var
    @var
  end
end

puts Tested.value_of_var

animal = "cat"
def animal.speak
  puts "The #{self} says meow"
end

animal.speak
puts animal.upcase
puts animal.singleton_class
puts animal.singleton_methods

class Dave
  def self.class_method_one
    puts "Class method one"
  end

  def Dave.class_method_two
    puts "Class method two"
  end
end

Dave.class_method_one
Dave.class_method_two

class Tests
  @var = 99

  def self.var
    @var
  end

  def self.var=(value)
    @var = value
  end
end

puts "Original value = #{Tests.var}"
Tests.var = "cat"
puts "New value = #{Tests.var}"

animal = "dog"
class << animal
  def speak
    puts "The #{self} says WOOF!"
  end
end

animal.speak

animal = "doggie"
def animal.speak
  puts "The #{self} says WOOF!"
end

singleton = class << animal
  def lie
    puts "The #{self} lies down"
  end
  self
end

animal.speak
animal.lie
puts "Singleton class object is #{singleton}"
puts "It defines methods #{singleton.instance_methods - animal.methods}"
puts "You can also access it as #{animal.singleton_class}"
puts "And the list of methods as #{animal.singleton_methods}"

class Tested
  @var = 99

  class << self
    attr_accessor :var
  end
end

puts "Original value = #{Tested.var}"
Tested.var = "cat"
puts "New value = #{Tested.var}"




