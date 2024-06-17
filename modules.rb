module Debug
    def who_am_i?
        "#{self.class.name} (id: #{self.object_id}): #{self.name}"
    end
end

class Phonograph
    include Debug

    attr_reader :name

    def initialize(name)
        @name = name
    end
end

class EightTrack
    include Debug

    attr_reader :name

    def initialize(name)
        @name = name
    end
end

phonograph = Phonograph.new("West End Blues")
eight_track = EightTrack.new("Surrealistic Pillow")

p phonograph
p eight_track

p phonograph.who_am_i?
p eight_track.who_am_i?

class Person
    include Comparable
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def to_s
        "#{@name}"
    end

    def <=>(other)
        self.name <=> other.name
    end
end

p1 = Person.new("Matz")
p2 = Person.new("Guido")
p3 = Person.new("Larry")

if p1 > p2
    puts "#{p1.name}'s name > #{p2.name}'s name"
end

puts "Sorted list: "
puts [p1,p2,p3].sort

module ExtendedNew
    def new_from_string(string, delimiter = ",")
        new(*string.split(delimiter))
    end
end

class Human
    extend ExtendedNew

    attr_reader :first_name, :last_name

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
    end

    def full_name = "#{@first_name} #{@last_name}"
end

superman = Human.new_from_string("Clark,Kent")
batman = Human.new_from_string("Bruce|Wayne", "|")
puts superman.full_name
puts batman.full_name
puts superman.first_name
puts batman.last_name

puts [1,2,3,4,5].reduce(:+)
puts ("a".."m").reduce(:+)

class VowelFinder
    include Enumerable

    def initialize(string)
        @string = string
    end

    def each
        @string.scan(/[aeiou]/) do |vowel|
            yield vowel
        end
    end
end

vf = VowelFinder.new("the quick brown fox jumped over the lazy dog")
p vf
puts vf.reduce(:+)

module Summable
    def sum
        reduce(:+)
    end
end

class Array
    include Summable
end

class Range
    include Summable
end

class VowelFinder
    include Summable
end

puts [1,2,3,4,5].sum
puts ("a".."m").sum
vf1 = VowelFinder.new("the quick brown fox jumped")
puts vf1.sum

module Observable
    def observers
        @observer_list ||= []
    end

    def add_observer(obj)
        observers << obj
    end

    def notify_observers
        observers.each {|o| o.update}
    end
end

module Test
    def self.states
        @states ||= {}
    end

    def state=(value)
        Test.states[object_id] = value
    end

    def state
        Test.states[object_id]
    end
end

class Client
    include Test
end

c1 = Client.new
c2 = Client.new
c1.state = "cat"
c2.state = "dog"
puts c1.state
puts c2.state

module Log
    def execute
        puts "logging"
        super
    end
end

module Caller
    def execute
        puts "calling"
        super
    end
end

class Parent
    def execute
        puts "parenting"
    end
end

class Child < Parent
    prepend Log
    include Caller

    def execute
        puts "childing"
        super
    end
end

puts Child.new.execute





