puts "Hello, Ruby Programmer"
puts "It is now #{Time.now}"

def say_hello_goodbye(name)
    "I don't know why you say goodbye, #{name.capitalize}, I say hello"
    #return result
end

puts say_hello_goodbye("john")
puts say_hello_goodbye("paul")
puts say_hello_goodbye("Ringo")

a = [1, 'cat', 3.14]
puts "The first element is #{a[0]}."
a[2] = nil
puts "The array is now #{a.inspect}."
p "The array is now #{a}."

instrument_section = {
    :cello => "string",
    :clarinet => "woodwind",
    :drum => "percussion",
    :oboe => "woodwind",
    :trumpet => "brass",
    :violin => "string"
}

p instrument_section[:oboe]
p instrument_section[:cello]
p instrument_section[:bassoon]

puts "An oboe is a #{instrument_section[:oboe]} instrument."

today = Time.now

if today.saturday?
    puts "Do chores around the house."
elsif today.sunday?
    puts "Relax."
else
    puts "Go to work."
end

num_pallets = 0
weight = 0
=begin
while weight < 100 && num_pallets <= 5
    pallet = next_pallet()
    weight += pallet.weight
    num_pallets += 1
=end

square = 4
puts square = square * square while square < 1000

line = "Ruby is for fun."
if line.match?(/Ruby|Rust/)
    puts "Scripting language mentioned: #{line}."
end

newline = line.sub(/Ruby/, 'RUBY')
puts newline

def call_block
    puts "Start of method"
    yield
    yield
    puts "End of method"
end

call_block{ puts "In the block"}

def who_says_what
    yield("Dave", "hello")
    yield("Andy", "goodbye")
end

who_says_what {|person,phrase| puts "#{person} says #{phrase}."}

animals = ["ant","bee","cat","dog"]
animals.each {|animal| puts animal}

animals.each {|name| print name, " "}
5.times {print "*"}
3.upto(6) {|i| print i}
("a".."e").each {|char| print char}
("a".."e").each {print _1 }
