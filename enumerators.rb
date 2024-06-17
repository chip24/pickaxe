a = [1,3, "cat"]
enum_a = a.to_enum
p enum_a.next
p enum_a.next

h = {dog: "canine", fox: "vulpine"}
enum_h = h.to_enum
p enum_h.next
p enum_h.next

enum_c = a.to_enum(:reverse_each)
p enum_c.next
p enum_c.next

d = ["Martika", "Kids Inc.", 1986]
enum_d = d.each
p enum_d
p enum_d.next
p enum_d.next

short_enum = [1,2,3].to_enum
long_enum = ("a".."z").to_enum

loop do
    puts "#{short_enum.next} - #{long_enum.next}"
end

result = []
['a','b','c'].each_with_index {|item, index| result << [item, index] }
p result

res = []
"kangaroo".each_char.each_with_index {|item, index| res << [item, index] }
p res

re = []
"alligator".each_char.with_index { |item, index| re << [item, index] }
p re

p "gorilla".each_char.with_index.map { |item, index| [item, index] }

enum = "narwhal".each_char
p enum.to_a
p enum
puts enum

enum_in_threes = (1..10).enum_for(:each_slice, 3)
p enum_in_threes.to_a

triangular_numbers = Enumerator.new do |yielder|
    number = 0
    count = 1
    loop do
        number += count
        puts "now number = #{number}"
        count += 1
        puts "now count = #{count}"
        yielder.yield(number)
        puts
        puts
    end
end

5.times { print triangular_numbers.next, " " }
puts

tri_nums = Enumerator.produce([1,2]) do |number, count|
     [number + count, count + 1]
end

6.times { print tri_nums.next.first, " "}
puts

p tri_nums.first(7).map {_1.first }

class InfiniteStream
    def all
        Enumerator.produce(0) do |number|
            number += 1
        end.lazy
    end
end


def palindrome?(n)
    n = n.to_s
    n == n.reverse
end

p InfiniteStream.new.all.first(10)

p InfiniteStream.new.all
.select { (_1 % 3).zero? }
.select { palindrome?(_1) }
.first(10)

mult_of_three = InfiniteStream.new.all.select { (_1 % 3).zero?}
p mult_of_three.first(15)
m3_palin = mult_of_three.select {palindrome?(_1) }
p m3_palin.first(15)

mult3 = -> n { (n % 3).zero? }
palindrome = -> n { n = n.to_s; n == n.reverse }

p InfiniteStream.new
.all
.select(&mult3)
.select(&palindrome)
.first(20)

triangle_nums = Enumerator.produce([1,2]) do |number, count|
    [number + count, count + 1]
end.lazy.map { _1.first}
p triangle_nums.first(22)



