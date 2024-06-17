module GeneralLogger
  def log(msg)
    puts Time.now.strftime("%H:%M: ") + msg
  end

  module ClassMethods
    def attr_logger(name)
      attr_reader name

      define_method("#{name}=") do |val|
        log "assigning #{val.inspect} to #{name}"
        instance_variable_set("@#{name}", val)
      end
    end
  end

  def self.included(host_class)
    host_class.extend(ClassMethods)
  end
end

class Example
  include GeneralLogger

  attr_logger :value
end

ex = Example.new
ex.log("New example created")
ex.value = 123
puts "Value is #{ex.value}"
ex.value = "cat"
puts "Value is #{ex.value}"

Person = Struct.new(:name, :address, :likes)

class Person
  def to_s
    "#{self.name} lives in #{self.address} and likes #{self.likes}"
  end
end

dave = Person.new("Dave", "TX")
dave.likes = "Programming Languages"
puts dave

LineItem = Data.define(:name, :price_in_cents, :count)
li_1 = LineItem.new("Apple", 105, 3)
li_2 = LineItem.new(name: "Orange", count: 2, price_in_cents: 75)

puts li_1.name
puts li_2.price_in_cents

li_3  = li_1.with(name: "Orange")
p li_3


