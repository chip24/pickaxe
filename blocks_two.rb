class File
    def self.my_open(*args)
        file = File.new(*args)
        return file unless block_given?
        result = yield file
        file.close
    end
end

class ProcExample
    def pass_in_block(&action)
        @stored_proc = action
    end

    def use_proc(parameter)
        @stored_proc.call(parameter)
    end
end

eg = ProcExample.new
p eg
eg.pass_in_block {|param| puts "The parameter is #{param}"}
eg.use_proc(99)

def create_block_object(&block)
    block
end

bo = create_block_object {|param| puts "You called me with #{param}"}
bo.call(99)
bo.call("cat")

bob = ->(param) {puts "You called me with #{param}" }
bob.call(98)
bob.call("dog")

bobo = lambda {|param| puts "You called me with #{param}"}
bobo.call 97
bobo.call "pig"

bobob = proc { |param| puts "You called me with #{param}" }
bobob.call 96
bobob.call "fox"

bobobo = Proc.new {|param| puts "You called me with #{param}" }
bobobo.call 95
bobobo.call "hen"

def n_times(thing)
    -> (n) {thing * n}
end

pl = n_times(23)
puts pl
p pl.call(3)
p pl.call(4)
p2 = n_times("Hello")
p p2
p p2.call(3)

def power_proc_generator
    value = 1
    -> {value += value }
end

pp = power_proc_generator

puts pp.call
puts pp.call
puts pp.call

proc1 = -> arg { puts "In proc1 with #{arg}"}
proc2 = -> arg1, arg2 { puts "In proc2 with #{arg1} and #{arg2}"}
proc3 = ->(arg1, arg2) { puts "In proc3 qith #{arg1} and #{arg2}"}

proc1.call "ant"
proc2.call "bee", "cat"
proc3.call "dog", "elk"

def my_if(condition, then_clause, else_clause)
    if condition
        then_clause.call
    else
        else_clause.call
    end
end
5.times do |val|
    my_if(
        val < 2,
        -> {puts "#{val} is small"},
        -> {puts "#{val} is big"}
    )
end

square = Proc.new { |x| x**2 }

def perform_operation_on(number, operation)
    operation.call(number)
end

double = Proc.new { |x| x * 2 }

puts perform_operation_on(5, square)
puts perform_operation_on(5, double)

perform_op_on = Proc.new do |number, operation|
    operation.call(number)
end

puts perform_op_on.call(3, square)
puts perform_op_on.call(3, double)

puts square.call(7)

a_lambda = lambda { puts "Hello world!" }

puts a_lambda
a_lambda.call

# in a lambda with stabby notation, you need to put the parameters in parentheses before the curly brackets
lambda_with_params =->(val) { val**2 }
squared = lambda_with_params.call(9)
puts squared

p val1 = lambda_with_params.call(1)
p val2 = lambda_with_params.(2)
p val3 = lambda_with_params[3]
p val4 = lambda_with_params === 4

numbers = [1,2,3,4,5]
squares = numbers.map {|n| n**2}
puts squares.join(", ")

square_lambda = lambda {|n| n**2 }
squares2 = numbers.map &square_lambda
p squares2

def create_counter(start)
    lambda { start += 1}
end

counter = create_counter(0)
puts counter.call
puts counter.call
puts counter.call

[1,2,3].each do |n|
    puts n
end

[1,2,3].each { |n| puts n}

#if you use 'block.call in the body of the method, you would need to add '(&block) as a parameter after 'def my_method'
def my_method
    #You can also use 'block.call' instead of yield
    yield
end

my_method { puts "Hello, World!" }

def explicit_version(&block)
    block.call(1)
    block.call(2)
    block.call(3)
end

explicit_version { |number| puts number * 2 }

def implicit_version
    yield 1
    yield 2
    yield 3
end

implicit_version { |number| puts number * 2}

proc = Proc.new {puts "Hello World!"}
proc.call

def my_method(hello, number)
    hello.call
    number.call(2)
end

print_hello = Proc.new { puts "Hey, World! "}
print_number = Proc.new { |n| puts n }

my_method(print_hello, print_number)

p [4,5,6].map(&:to_s)

p [6,7,8].map { |i| i.to_s }

say_something = -> { puts 'This is a lambda' }
say_something.call

print_m = lambda { puts "Hopefully you will see this method."}
print_m.call

print_n = lambda { |n| puts "You will not see this message and the argument #{n}"}
print_n.call(4)

print_p = Proc.new { |n| puts "You will see this message"}
print_p.call

def call_proc
    puts "This will be printed"
    my_proc = Proc.new { return 1}
    my_proc.call
    puts "This will not be printed"
end

call_proc

def call_lambda
    puts "This will be printed"
    my_proc = -> { return 1 }
    my_proc.call
    puts "This will also be printed"
end

call_lambda

def my_method(my_proc)
    count = 3
    my_proc.call
end

count = 1
my_proc = Proc.new { puts count }
count = 2

puts my_method(my_proc)

def n_times(thing)
    ->(n) { thing * n }
end

p1 = n_times(23)
puts p1
p p1.call(3)
p p1.call(4)
p2 = n_times("Hello")
p p2.call(3)

def power_proc_generator
    value = 1
    -> {value += value }
end

power_proc = power_proc_generator
puts power_proc.call
puts power_proc.call
puts power_proc.call

def my_if(condition, then_clause, else_clause)
    if condition
        then_clause.call
    else
        else_clause.call
    end
end

5.times do |val|
    my_if(val < 2, -> { puts "#{val} is small"}, -> { puts "#{val} is big"} )
end

def my_while(cond, &body)
    while cond.call
        body.call
    end
end

a = 0
my_while(-> {a < 3}) do
    puts a
    a += 1
end

proc1 = lambda do |a, *b, &block|
    puts "a = #{a.inspect}"
    puts "b = #{b.inspect}"
    block.call
end

proc1.call(1,2,3,4) {puts "in block1"}

proc2 = -> (a, *b, &block) do
    puts "a = #{a.inspect}"
    puts "b = #{b.inspect}"
    block.call
end

proc2.call(1,2,3,4) {puts "in block2"}

