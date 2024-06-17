a = [3.14159, "pie", 99]
puts a.class
puts a.length
puts a[0]
puts a[1]
puts a[2]
puts a[3]

b = Array.new
puts b.class
puts b.length
b[0] = "second"
b[1] = "array"
p b

c = [1,3,5,7,9]
puts c[-1]
puts c[-2]
p c[-99]

p c[1,3]
p c[3,1]
p c[-3,2]

# [3,5,7]
p c[1..3]
# [3,5]
p c[1...3]
# [5]
p c[3..3]
# [5,7,9]
p c[-3..-1]

c[1] = "bat"
c[-3] = "cat"
c[3] = [9,8]
c[6] = 99
p c

d = [1,3,5,7,9]
d[2,2] = 'cat'
p d
d[2,0] = 'dog'
p d
d[1,1] = [9,8,7]
p d
d[0..3] = []
p d
d[5..6] = 99,98
p d

e = %w[ant bee cat dog elk]
p e

f = %i[ant bee cat dog elk]
p f

stack = []
stack.push "red"
stack.push "green"
stack.push "blue"
p stack

stack.pop
stack.pop
p stack

queue = []
queue.push "red"
p queue 
queue.push "green"
p queue
queue.shift
p queue

array = [1,2,3,4,5]
p array.first
p array.first(4)
p array.last
p array.last(4)

h = {"dog" => "canine", "cat" => "feline", "bear" => "ursine"}
puts h.length
puts h["dog"]
h["cow"] = "bovine"
h[12] = "dodecine"
h["cat"] = 99
p h

firstname = "Fred"
lastname = "Flintstone"
user = {firstname:, lastname:}
p user


