module AttrLogger
  def attr_logger(name)
    attr_reader name

    define_method("#{name}=") do |val|
      puts "Assigning #{val.inspect} to #{name}"
      instance_variable_set("@#{name}", val)
    end
  end
end

class Example
  extend AttrLogger
  attr_logger :value
end

exp = Example.new
exp.value = 123
puts "Value is #{exp.value}"
exp.value = "cat"
puts "Value is now #{exp.value}"