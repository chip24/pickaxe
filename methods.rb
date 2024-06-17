p 1.even?
p 2.even?
p 1.instance_of?(Integer)

class Matrix
    attr_reader :x, :y

    def initialize(x,y)
        @x = x
        @y = y
    end

    def to_s = "{#{x}, #{y}}"

    def +(other)
        Matrix.new(x + other.x, y + other.y)
    end
end

mat = Matrix.new(6,9)
p mat
puts mat
p mat.x
p mat.y
puts mat.x
puts mat.y

first = Matrix.new(1,2)
second = Matrix.new(3,4)
puts first + second

class Computer
    def self.function
        "I'm afraid I can't do that"
    end
end

puts Computer.function

class Computer
end

mac = Computer.new
pc = Computer.new

def mac.introduction = "I'm a Mac"
def pc.introduction = "I'm a PC"

puts mac.introduction
puts pc.introduction

def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
    puts "#{arg1}, #{arg2}, and #{arg3}"
end

cool_dude
cool_dude("Bart")
cool_dude("Bart", "Elwood")
cool_dude("Bart", "Elwood", "Linus")

def surround(word, pad_width = word.length/2)
    puts "[" * pad_width + word + "]" * pad_width
end

surround("elephant")
surround("fox")
surround("fox",10)

def variable_args(arg1, *rest)
    puts "arg1=#{arg1} -- rest=#{rest.inspect}"
end

variable_args("one")
variable_args("one", "two")
variable_args("one","two","three")

class Example
    def method_1(*)
     method_2(*)
    end

    def method_2(*array_args)
        puts array_args.join(", ")
    end
end

puts Example.new.method_1("a", "b", "c")

ex = Example.new
p ex
ex.method_1("d","e", "f")
ex.method_2("g","h","i")

def split_apart(first, *splat, last)
    puts "First: #{first.inspect}, splat: #{splat.inspect}, + last: #{last.inspect}"
end

split_apart(1,2)
split_apart(1,2,3)
split_apart(1,2,3,4)
split_apart(1,2,3,4,5)

def method_with_keywords(city:, state:, zip:)
    puts "The zip code #{zip} is in the city of #{city} in the state of #{state}."
end

method_with_keywords(zip: "60606", state: "IL", city: "Chicago")

def varargs(arg1, **rest)
    puts "arg1=#{arg1}.  rest=#{rest.inspect}"
end

varargs("one")
varargs("one", color: "red")
varargs "one", color: "red", size: "xl"

def double(p1)
    yield(p1 * 2)
end

puts double(3) { |val| "I got #{val}"}
puts double("tom") { |val| "Then I got #{val}"}

class TaxCalculator
    def initialize(name, &block)
        @name, @block = name, block
    end

    def get_tax(amount)
        "#@name on $#{amount} = $#{ @block.call(amount) }"
    end
end

tc = TaxCalculator.new("Sales tax") {|amt| amt * 0.075 }

p tc.get_tax(100)
p tc.get_tax(250)

class Person
    attr_reader :name
    def name=(new_name)
        @name = new_name
    end
end

per = Person.new
per.name = "Brandi Carlile"
p per.name
puts per.name
per.name=("Elton John")
p per.name
puts per.name

puts method_with_keywords(city: "Chicago", state: "IL", zip: "60606")
puts method_with_keywords(zip: "02134", city: "Boston", state: "MA")

def method_one
    "one"
end

p method_one

def method_two(arg)
    case
    when arg > 0 then "positive"
    when arg < 0 then "negative"
    else "zero"
    end
end

puts method_two(23)
puts method_two(0)
puts method_two(-33)

def method_three
    100.times do |num|
        square = num * num
        return num, square if square > 1000
    end
end
p method_three
#p num, square = method_three

def five(a,b,c,d,e)
    puts "I was passed #{a} #{b} #{c} #{d} and #{e}"
end

five(1,2,3,4,5)
five(1,2,3,*['a', 'b'])
five(*['a','b'], 1, 2, 3)
five(*(10..14))
five(*[1,2],3, *(4..5))

def method_with_keywords(city:, state:, zip:)
    "I live in #{city}, #{state} #{zip}."
end

data = {city: "Birmingham", state: "AL", zip: "35222"}
puts method_with_keywords(**data)

city = "Arlington Heights"
state = "IL"
zip = "60005"

puts method_with_keywords(city:, state:, zip:)

alpha = ["a","b","c"]

p alpha.map { |s| s.upcase }
p alpha.map(&:upcase)

