puts 0xaabb
puts -0b10_1010

require "bigdecimal"
x = BigDecimal("3.14")
y = BigDecimal("4.13")
puts x + y

puts 3/4
puts 3/4r
puts 0.75r
puts "3/4".to_r
puts Rational(3,4)
puts Rational("3/4") 

puts 1+2i
puts "1+2i".to_c
puts Complex(1,2)
puts Complex("1+2i")

puts 1 + 2
puts 1 + 2.0
puts 1.0 + 2
puts 1.0 + 1+2i
puts 1 + 2/3r
puts 1.0 + 2/3r

puts 1.0 / 2
puts 1 / 2.0
puts 1 / 2
puts 1.to_f / 2
puts 1 * 1.0 / 2
puts 1.fdiv(2)

p 3.times { print "X " }
p 1.upto(5) {|i| print i, " " }
p 99.downto(95) {|i| print i, " " }
p 50.step(80, 5) { |i| print i, " " }
p 3.times

10.downto(7).with_index { |num, index| puts "#{index}: #{num}" }

puts 'escape using "\\"'
puts 'That\'s right'

puts "Seconds/day: #{24 * 60 * 60}"
puts "#{'Ho! ' * 3}Merry Christmas!"

puts %q/general single-quoted string/
puts %Q!general double-quoted string!
puts %Q{Seconds/day: #{24*60*60}}
puts %!general doulble-quoted string!
puts %{Seconds/day: #{24*60*60}}

string = <<END_OF_STRING
The body of the string is the input lines up to one starting with the same text that followd the '<<'
END_OF_STRING

puts string

def a_long_string
    <<~END_OF_STRING
        Faster than a speeding bullet, more powerful that a locomotive, able to leap tall buildings in a single bound-look, up there in rhe sky, it's a bird, it's a plane, it's Superman!
        END_OF_STRING
end

puts a_long_string

plain_string = "dog"
puts "Encoding of #{plain_string.inspect} is #{plain_string.encoding}"