person = "Bonquiqui"

person1 = "Tim"
person2 = person1
person1[0] = "J"

puts "person1 is #{person1}"
puts "person2 is #{person2}"

puts "The object in 'person' is a #{person.class}."
print "The object has an id of #{person.object_id} "
puts "and a value of #{person}."

person3 = "Amanda Tory Meeting"
person4 = person3.dup
person3[0] = "U"
puts "person3 is #{person3}"
puts "person4 is #{person4}"

person5 = "Trixie"
person6 = person5
person5.freeze
#person6[0] = "F"

class Book
    attr_accessor :title
end

class Book
    def uppercase_title
        title.upcase
    end
end


