require "net/http"

pages = %w[www.rubycentral.org www.pragprog.com www.google.com]

threads = pages.map do |page_to_fetch|
    Thread.new(page_to_fetch) do |url|
        http = Net::HTTP.new(url, 80)
        print "Fetching: #{url}\n"
        response = http.get("/")
        print "Got #{url}: #{response.message}\n"
    end
end
threads.each {|thread| thread.join }
print "We're done here!\n"
p Thread.list

count = 0
threads = 10.times.map do |i|
    Thread.new do
        sleep(rand(0.1))
        Thread.current[:mycount] = count
        count += 1
    end
end

threads.each do |t|
    t.join
    print t[:mycount], ", "
end
puts "count = #{count}"

threads = 4.times.map do |number|
    Thread.new(number) do |i|
        raise "Boom!" if i == 1
        print "#{i}\n"
    end
end
puts "Waiting"
threads.each do |t|
    begin
        t.join
    rescue RuntimeError => e
        puts "Failed: #{e.message}"
    end
end
puts "Done"
=begin 
Thread.abort_on_exception = true
threads = 4.times.map do |number|
    Thread.new(number) do |i|
        raise "Boom!" if i == 1
        print "#{i}\n"
    end
end
puts "Waiting"
threads.each {|t| t.join }
puts "Done"
=end

sum = 0
threads = 10.times.map do
    Thread.new do
        100_000.times do
            new_value = sum + 1
            print "#{new_value} " if new_value % 250_000 == 0
            sum = new_value
        end
    end
end
p threads
threads.each(&:join)
puts "\nsum = #{sum}"

sum = 0
mutex = Thread::Mutex.new
threads = 10.times.map do
    Thread.new do
        100_000.times do
            # one at a time, please
            mutex.lock
            new_value = sum + 1
            print "#{new_value} " if new_value % 250_000 == 0
            sum = new_value
            mutex.unlock
        end
    end
end
threads.each(&:join)
puts "\nsum = #{sum}"

puts spawn("date")
puts system("date")
puts `date`
=begin 
pig = IO.popen("/home/chip/repos/pickaxe/pig.txt", "w")
pig.puts "ice cream after they go to bed"
pig.close_write
puts pig.gets
=end

new_pipe = IO.popen("-","w+")
if new_pipe
    new_pipe.puts "Get a job!"
    $stderr.puts "I'm the parent, the child said to me '#{new_pipe.gets.chomp}'"
else
    $stderr.puts "I'm the child, the parent said to me '#{gets.chomp}'"
    puts "OK"
end

IO.popen("date") {|f| puts "Date is #{f.gets}"}

fork do
    puts "In child, pid = #$$"
    exit 99
end
pid = Process.wait
puts "Child teminated, pid = #{pid}, status = #{$?.exitstatus}"