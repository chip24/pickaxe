def two_times
    yield
    yield
end

two_times { puts "Hello"}

def fib_up_to(max)
    # parallel assignment (i1 = 1 and i2 = 1)
    i1, i2 = 1, 1
    while i1 <= max
        yield i1
        i1, i2 = i2, i1 + i2
    end
end

fib_up_to(1000) {|f| print f, " "}
puts 

arr = [1,3,5,7,9]
arr.each {|i| puts i}

puts arr.find { |number| number * number > 30}

p arr.map { |number| number * number }

p ["H","A","L"].map { |x| x.succ }


