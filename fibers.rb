counts = Hash.new(0)
# p counts
File.foreach("mechanical_pencils.txt") do |line|
    line.scan(/\w+/) do |word|
        word = word.downcase
        counts[word] += 1
    end
end

counts.keys.sort.each {|k| puts "#{k}:#{counts[k]} " }
#counts.values.sort.each {|v| puts "#{v}:#{counts[v]}"}
values_sorted = counts.sort_by(&:last)

values_sorted.each {|i| puts "#{i[1]} occurence(s) of the word '#{i[0]}'"}

words = Fiber.new do
    File.foreach("mechanical_pencils.txt") do |line|
        line.scan(/\w+/) do |word|
            #the following line is missing the parentheses in the book 
            Fiber.yield(word.downcase)
        end
    end
    nil
end
#p words

counts_two = Hash.new(0)
#p counts_two
while (word = words.resume)
    counts_two[word] += 1
    #p counts_two
end
#p counts_two

counts_two.keys.sort.each {|k| print "#{k}:#{counts_two[k]}  "}

twos = Fiber.new do
    num = 2
    loop do
        Fiber.yield(num) unless num % 3 == 0
        num += 2
    end
end

10.times {print twos.resume, " "}
=begin
reader = Ractor.new(name: "reader") do
    File.foreach("mechanical_pencils.txt") do |line|
        line.scan(/\w+/) do |word|
            Ractor.yield(word.downcase)
        end
    end
    nil
end

counter = Ractor.new(reader, name: "counter") do |source|
    result = Hash.new(0)
    while(word = source.take)
        result[word] += 1
    end
    result
end

counts = counter.take
counts.keys.sort.each { |k| print "#{k}:#{counts[k]}"}


counter = Ractor.new(name: "counter") do
    result = Hash.new(0)
    while (word = Ractor.receive)
        result[word] += 1
    end
    result
end

Ractor.new(counter, name: "reader") do |worker|
    File.foreach("mechanical_pencils.txt") do |line|
        line.scan(/\w+/) do |word|
            worker.send(word.downcase)
        end
    end
    worker.send(nil)
end
counts = counter.take
counts.keys.sort.each {|k| print "#{k}:#{counts[k]}"}
=end








