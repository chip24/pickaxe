def header(name, level: 1, upper: false, **attrs)
  name = name.upcase if upper
  attr_string = attrs.map { |k,v| %(#{k} = "#{v}")}.join(" ")
  "<h#{level} #{attr_string}>#{name}</h#{level}>"
end

puts header("TOC", class: "nav", level: 2, id: 123)

def regular(a,b,*c)
  puts "a = #{a}, b = #{b}, c = #{c}"
end

regular 1,2,3,4
regular(1,2,3,4)
regular(1,*2, *3, 4)
regular(1, *[2,3,4])
regular(1, *[2,3],4)
regular(1, *[2,3], *4)

def keywords(a, b: 2, c: 3, **rest)
  puts "a = #{a}, b = #{b}, c = #{c}, rest = #{rest}"
end

keywords(99)
keywords(99, c: 98)
args = {b: 22, c: 33}
keywords(99, **args)
keywords(99, **args, b: "override")
keywords(99, d: 22, e: 33)

def regular(a, b)
  puts "a - #{a}, b = #{b}"
end

regular(99, a: 1, b: 2)

others = {c: 3, d: 4}
regular(99, a: 1, b: 2, **others)
regular(99, **others, a: 1, b: 2)

rest = {e: 5}
regular(99, **others, a: 1, b: 2)
regular(99, **others, a: 1, b: 2, **rest)

def some_method
  yield
end

some_method { }
some_method do
end

a_proc = lambda {99}
some_method(&a_proc)

def odd_or_even(val)
  if val.odd?
    "odd"
  else
    "even"
  end
end

puts odd_or_even(26)
puts odd_or_even(27)

class Parent
  def initialize(name)
    @name = name
  end

  def greet
    "Hello from Parent"
  end
end


class Child < Parent
  def initialize(name, age)
    super(name)
    @age = age
  end

  def greet
    result = super
    result + ", and Hello from Child!"
  end
end

kid = Child.new("Patoot", 34)
p kid
puts kid.greet



