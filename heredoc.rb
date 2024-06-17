print <<~HERE
  This is indented.
  But the result will not have
  the indentation.
HERE

def show_encoding(str)
  puts "'#{str}'(size #{str.size}) is #{str.encoding.name}"
end

show_encoding("cat")
show_encoding("dog")

puts "Greek pi: \u03c0"
puts "Greek pi \u{3c0}"
puts "Greek \u{70 69 3a 20 3c0}"
p "pi: \u03c0".bytes

arr = %w(fred wilma barney betty great\ gazoo)
p arr

arr = %w(Hey!\tIt is now-#{Time.now}-)
p arr

arr = %W(Hey!\tIt is now-#{Time.now}-)
p arr

arr = [1,2,3]
hash = {arr => "value"}
p hash
p hash[arr]
arr[1] = 99
p hash
p hash[arr]
hash.rehash
p hash[arr]

str = "now is the time"
puts str.gsub(/[a-z&&[^aeiou]]/, '*')

#show_regexp('über.', /\w+/)
#show_regexp('über.', /(?a)\w+/)

meth = %q{def fred(a)
 a.each {|i| puts i}
end}
puts meth
def a
  puts "function 'a' is called"
  99
end

(1..2).each do |i|
  if i == 2
    puts "i==2, a=#{a}"
  else
    a = 1
    puts "i==1, a=#{a}"
  end
end

OUTER_CONST = 99
class Const
  def get_const
    CONST
  end
  CONST = OUTER_CONST + 1
end

puts Const.new.get_const
puts Const::CONST
puts ::OUTER_CONST
Const::NEW_CONST = 123
puts Const::CONST
puts Const::NEW_CONST
puts OUTER_CONST

class Song
  @@count = 0

  def initialize
    @@count += 1
  end

  def Song.get_count
    @@count
  end
end

s1 = Song.new
s2 = Song.new
s3 = Song.new
puts Song.get_count

class Top
  @@A = "top A"
  @@B = "top B"

  def dump
    puts values
  end

  def values
    "#{self.class.name}: @@A = #@@A, @@B = #@@B"
  end
end

class MiddleOne < Top
  @@B = "One B"
  @@C = "One C"
  def values
    super + ", C = #@@C"
  end
end

class MiddleTwo < Top
  @@B = "Two B"
  @@C = "Two C"

  def values
    super + ", C = #@@C"
  end
end

class BottomOne < MiddleOne; end
class BottomTwo < MiddleTwo; end

puts Top.new.dump
puts MiddleOne.new.dump
puts MiddleTwo.new.dump
puts BottomOne.new.dump
puts BottomTwo.new.dump

3 => x
puts x

{a: 1, b: 2} in {a:, b:}
puts a
puts b

a = (11..20).collect { |i| (i % 4 == 0)..(i % 3 ==0) ? i : nil}
p a

b = (11..20).collect { |i| (i % 4 == 0)...(i % 3 ==0) ? i : nil}
p b

(1..20).each do |x|
  puts x if (x == 5) .. (x == 10)
end

