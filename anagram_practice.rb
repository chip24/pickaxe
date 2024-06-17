def signature_of(word)
    word.unpack("c*").sort.pack("c*")
end

p signature_of("teaching") 

h = {}
#p h[a:]
p h[:a] ||= 10
p h

class Triangle
    SIDES = 3
    def area
        #
    end
end

class Square
    SIDES = 4
    def initialize(side_length)
        @side_length = side_length
    end

    def area
        @side_length * @side_length
    end
end

puts "A triangle has #{Triangle::SIDES} sides"

sq = Square.new(3)

puts "Area of square = #{sq.area}"