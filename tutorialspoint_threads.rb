def func1
    i = 0
    while i <= 2
        puts "func1 at : #{Time.now}"
        sleep(2)
        i = i + 1
    end
end

def func2
    j = 0
    while j <= 2
        puts "func2 at: #{Time.now}"
        sleep(1)
        j = j + 1
    end
end

puts "Started At #{Time.now}"
t1 = Thread.new{func1()}
t2 = Thread.new{func2()}
t1.join
t2.join
puts "End at #{Time.now}"

count = 0
arr = []
10.times do |i|
    arr[i] = Thread.new {
        sleep(rand(0)/10.0)
        Thread.current["mycount"] = count
        count += 1
    }
end

arr.each {|t| t.join; print t["mycount"], ", "}
puts "count = #{count}"