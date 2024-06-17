class OneTwo
  def to_a
    [1,2]
  end
end

ot = OneTwo.new
puts ot
a, b = *ot
puts "a = #{a}, b = #{b}"
printf("%d -- %d\n", *ot)

class TwoThree
  def to_proc
    proc { "two-three"}
  end
end

def silly
  yield
end

tt = TwoThree.new
p silly(&tt)

class ThreeFour
  def to_str
    "three-four"
  end
end

tf = ThreeFour.new
puts("count: " + tf )
File.open(tf) rescue puts $!.message

names = %w[ant bee cat]
result = names.map { |name| name.upcase }
p result

food = %w[sandwich rice curry donut]
food_array = food.map(&:upcase)
p food_array

p 1.coerce(2)
p 1.coerce(2.3)

