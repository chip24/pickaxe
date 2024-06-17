def add(a,b)
    a + b
end
puts add(3,4)

def perform(a,b)
    puts 'peforming the operation you provided via block'
    yield
    puts 'operation completed'
end

#puts perform(5,6) { |a,b| a + b }

def greet(name)
    puts "hey, #{name}"
    yield
    puts "bye!"
end

greet("Matz") { puts "Thanks for creating Ruby"}

greet("David") do
    puts "Thanks for creating Rails"
end

def build_response
    response = create_response_somehow
    yield response if block_given?
    do_cleanup
end

def add(a,b)
    sum = a + b
    yield sum
end

add(3,4) {|sum| puts "result: #{sum}"}
add(4,5) do |sum|
    puts "result: #{sum}"
end

adder = ->(a,b) { a + b }
#perform(adder)
result = adder.call(3,4)
puts "The result is #{result}"

operation = proc {|arg| puts "a proc with argument: #{arg}"}
operation.call 10
operation.yield 5
operation[2]

def greet(name, handler)
    puts "hey, #{name}"
    handler.call
    puts "bye"
end

greet("David", lambda {puts "Thanks for creating Rails"})
greet("Taylor", -> {puts "Thanks for creating Laravel"})
greet("Adam", proc {puts "Thanks for creating Tailwind CSS"})
greet("Anders", Proc.new {puts "Thanks for creating C#"})

proc_one = proc {puts "a proc"}
puts proc_one.lambda?
proc_two = lambda { puts "a lambda" }
puts proc_two.lambda?

def run_proc
    p = proc {return 10}
    p.call
    20
end

def run_lambda
    p = lambda { return 10 }
    p.call
    20
end

result = run_proc
puts result

result = run_lambda
puts result

pr = proc { |a,b| puts a + b }
pr.call(10,20)

la = ->(a,b) {puts a + b}
la.call(22,33)

# a lambda can acccess variables outside its scope
name = 'ruby'
printer =-> {puts name}
printer.call

# a regular function cannot access variables outside its scope.  This will return an error
def print
    puts name
end

#print

num = 1

Runner = Class.new do
    puts "#{num} from class"

    define_method :run do
        puts "#{num} from method"
    end
end

Runner.new.run

def scope(name, condition)
    puts 'condition: ' + name.to_s

    if condition.call
        puts 'creating scope'
    end

    puts 'scope was added'
end

#scope :custom, ->{ user.admin? }

def benchmark(name, operation)
    start_time = Time.now.to_i
    operation.call
    duration = Time.now.to_i - start_time
    puts "#{name} took #{duration} seconds"
end

benchmark( :nap, ->{sleep(3)})
