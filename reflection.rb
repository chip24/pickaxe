a = Complex(1, 2)
b = Complex(99, -100)
ObjectSpace.each_object(Complex) {|x| puts x}

a = 102
b = 95
ObjectSpace.each_object(Integer) {|x| p x}

r = 1..10
puts r
list = r.methods
puts list.length
p list[0..3]
puts r.respond_to?("frozen?")
puts r.respond_to?(:key?)
puts "me".respond_to?("==")

num = 1
puts num.object_id
puts num.class
puts num.kind_of? Integer
puts num.kind_of? Numeric
puts num.instance_of? Integer
puts num.instance_of? Numeric