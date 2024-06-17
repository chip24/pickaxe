arr = (1..10).to_a
p ('bar'..'bat').to_a
p enum = ('bar'..'bat').to_enum
p enum.next
p enum.next

p arr[..2]
p arr[2..]

digits = 0..9
puts digits.include?(5)
puts digits.max
p digits.reject {|i| i < 5 }
puts digits.reduce(:+)

class PowerOfTwo
    attr_reader :value

    def initialize(value)
        @value = value
    end

    def <=>(other)
        @value <=> other.value
    end

    def succ
        PowerOfTwo.new(@value + @value)
    end

    def to_s
        @value.to_s
    end
end

p1 = PowerOfTwo.new(4)
p2 = PowerOfTwo.new(32)
puts (p1..p2).to_a

puts (1..10) === 5
puts (1..10) === 15
puts (1..10) === 3.14159
puts ('a'..'j') === 'c'
puts ('a'..'j') === 'z'
puts ('a'..'j').include?('c')
puts ('a'..'j').include?('bb')
puts ('a'..'j').cover?('bb')

car_age = 9.5
case car_age
when 0...1
    puts "Mmm.. new car smell"
when 1...3
    puts "Nice and new"
when 3...10
    puts "Reliable but slightly dinged"
when 10...30
    puts "Clunker"
else
    puts "Vintage gem"
end


