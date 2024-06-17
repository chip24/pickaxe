p [3,1,7,0].sort.reverse

a,b,c = 1, 2, 3
puts a * b + c
puts (a.*(b)).+(c)

a = [1,2,3]
a << 4
p a

class ScoreKeeper
    def initialize
        @total_score = @count = 0
    end

    def <<(score)
        @total_score += score
        @count += 1
        self
    end

    def average
        fail "No scores" if @count.zero?
        Float(@total_score) / @count
    end
end

scores = ScoreKeeper.new
scores << 10 << 20 << 40
puts "Average = #{scores.average}"

class SomeClass
    def []=(*params)
        value = params.pop
        puts "Indexed with #{params.join(', ')}"
        puts "value = #{value.inspect}"
    end
end
s = SomeClass.new
s[1] = 2
s['cat', 'dog'] = 'enemies'

puts `date`
p `ls`.split[34]
puts %x{echo "hello there"}

class ProjectList
    def initialize
        @projects = []
    end

    def projects=(list)
        @projects = list.map(&:upcase)
    end

    def [](offset)
        @projects[offset]
    end
end

list =ProjectList.new
list.projects = %w{strip sand prime paint sand paint rub paint}
p list
p list[3]
p list[4]

class Test
    def val=(val)
        @val = val
        return 99
    end
end

t = Test.new
result = (t.val = 2)
p result

2 => x
puts x

a,b,c,d,e = *(1..2),3,*[4,5]
p a
p b
p c
p d
p e

a,*b = 1,2,3
p a
p b

*a,b = 1,2,3,4
p a
p b

c,*d,e = 1,2,3,4
p c
p d
p e 

f,*g,h,i,j = 1,2,3,4
p f
p g
p h
p i
p j

first, *, last = 1,2,3,4,5,6
p first
p last

a,(b,c),d = 1,2,3,4
p a
p b
p c 
p d

a,(b,c),d = [1,2,3,4]
p a
p b
p c
p d

a,(b,c),d = 1,[2,3],4
p a
p b
p c
p d 

a,(b,c),d = 1,[2,3,4],5
p a
p b
p c
p d 

a,(b,*c),d = 1,[2,3,4],5

p a
p b
p c
p d

# && will return the first argument if falsey and the second argument if truthy
puts nil && 99
puts false && 99
puts "cat" && 99

# && has a higher precedence than "and" and will give different results

# && has a higher precedencce than the assignment, so it is evaluated first returning "b" as if the line was written result=("a" && "b")
result = "a" && "b"
puts result

# in this line, the assignment has precedence, so result is set to "a", then && is evaluated
result = "a" and "b"
puts result

# || and "or" return their first argument unless that argument is falsey.  Then it will return the second argument
puts nil || 99
puts false || 99
puts "cat" || 99

# a common idiom - ||= - assigns a value to a varaible only if that variable isn't already set e.g. var ||= "default value"

p defined? 1
p defined? dummy
p defined? printf
p defined? String
p defined? $_
p defined? Math::PI
p defined? a = 1
p defined? 42.abs
p defined? nil

class T
    def ==(other)
        puts "Comparing self == #{other}"
        other == "value"
    end
end

t = T.new
p (t == "value")
p ( t != "value")

a = 1
puts a *= 2 while a < 180
b = 128
puts b -= 10 while b < 100