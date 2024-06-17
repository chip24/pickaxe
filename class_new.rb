some_class = Class.new do
  def self.class_method
    puts "In class method"
  end

  def instance_method
    puts "In instance method"
  end
end

some_class.class_method
obj = some_class.new
p some_class.name
obj.instance_method

a_class = Class.new(String) do
  def vowel_movement
    tr 'aeiou', '*'
  end
end

obj = a_class.new("now is the time")
puts obj.vowel_movement

def MyStruct(*keys)
  Class.new do
    attr_accessor *keys

    def initialize(hash)
      hash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end

Person = MyStruct :name, :address, :likes
dave = Person.new(name: "dave", address: "TX", likes: "Stilton")
chad = Person.new(name: "chad", likes: "Jazz")
chad.address = "Berlin"
puts "Dave's name is #{dave.name}"
puts "Chad lives in #{chad.address}"

"cat".instance_eval do
  puts "Upper case = #{upcase}"
  puts "Length is #{self.length}"
end

class MyClass
end

MyClass.class_eval do
  def instance_method
    puts "In an instance method"
  end
end

obj = MyClass.new
obj.instance_method


@animal = "cat"
"dog".instance_exec(@animal) do |other|
  puts "#{other} and #{self}"
end

module One
  CONST = "Defined in One"
  def self.eval_block(&block)
    instance_eval(&block)
  end
end

module Two
  CONST = "Defined in Two"
  def self.call_eval_block
    One.eval_block do
      CONST
    end
  end
end

puts Two.call_eval_block


