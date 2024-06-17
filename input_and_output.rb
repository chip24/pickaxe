File.open("ordinals.txt") do |file|
    while line = (file.gets)
        puts line
    end
end

File.open("mechanical_pencils.txt") do |file|
    file.each_byte.with_index do |ch, index|
        print "#{ch.chr}:#{ch}  "
        break if index > 10
    end
end

File.open("testfile.txt") do |file|
    file.each_line {|line| puts "Got #{line.dump}"}
end

File.foreach("testfile.txt") { |line| puts line }

str = IO.read("testfile.txt")
puts str.length
puts str[0,30]

arr = IO.readlines("testfile.txt")
puts arr.length
puts arr[0]

File.open("output.txt","w") do |file|
    file.puts "Hello"
    file.puts "1 + 2 = #{1 + 2}"
end

puts File.read("output.txt")

str1 = "\001\002\003"
#puts str1
str2 = ""
str2 << 1 << 2 << 3
#puts str2
#puts [1,2,3].pack("c*")

puts File.realpath("testfile.txt")
puts File.realpath(__FILE__)
puts File.realpath(__dir__)

endl = "\n"
$stdout << 99 << " red balloons" << endl
puts endl

require 'stringio'

ip = StringIO.new("now is\nthetime\nto learn\nRuby!")
op = StringIO.new("","w")

ip.each_line do |line|
    op.puts line.reverse
end
puts op.string

require 'socket'

#client = TCPSocket.open("127.0.0.1", "www")
#client.send("OPTIONS /~dave/ HTTP/1.0\n\n", 0)
#puts client.readlines
#client.close

require "net/http"

uri = URI("https://pragprog.com/titles/ruby5/programming-ruby-3-2-5th-edition/"
)
Net::HTTP.start(
    "pragprog.com",
    Net::HTTP.https_default_port,
    use_ssl: true 
) do |http|
    request = Net::HTTP::Get.new(uri)
    response = http.request(request)
    if response.code == "200"
        puts response.body.scan(/<img class=".*?" src="(.*?)"/m).uniq[0,3]
    end
end

require "open-uri"

#URI.open("https://pragprog.com/titles/ruby5/programming-ruby-3-2-5th-edition/") do |f|
#    puts f.read.scan(/<img class=".*?" src="(.*?)"/m).uniq[0.3]
#end




