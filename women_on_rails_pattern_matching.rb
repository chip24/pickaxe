case [1,2]
    in [2,a]
    puts "No match"
    in [1,a]
    puts "Match"
end

puts a

case [1,2,3,4]
    in [1,*a]
end

p a 

case [1,2,3]
    in [_, a, 3]
end

p a

case [1,[2,3,4]]
    in [a, [b, *c]]
end

p a
p b
p c

case {foo: 1, bar: 2}
    in {foo: 1, baz: 3}
    puts "No match"
    in {foo: 1, bar: b }
    puts "Match"
end

p b 

case {foo: 1, bar: 2, baz: 3 }
    in {foo: 1, **rest }
end

p rest 

case {foo: 1, bar: 2 }
    in foo:, bar:
end

p foo
p bar

case [1,2,3]
    in [a, *c] if a != 1
    puts "no match"
    in [a, *c] if a == 1
    puts "match"
end

p a
p c

array = [5,6,7]
case [1,2,4]
    in array
    puts "match"
end
p array

case [1,2,3]
in ^array
    puts "no match"
else
    puts "match"
end
p array 

case [1,2,[3,4]]
    in [1,2,[3,b] => a]
end
p a
p b

Point = Struct.new(:latitude, :longitude)
point = Point[50.29543618146685, 18.666200637817383]

case point
in latitude, longitude
end

p latitude
p longitude

class Date
    def deconstruct_keys(keys)
        { year: year, month: month, day: day }
    end
end

#date = Date.new(2019, 9, 21)

#case date
#in year:
#end



