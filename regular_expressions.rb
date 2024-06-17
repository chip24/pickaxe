puts /cat/ =~ "dog and cat"
puts /cat/ =~ "catch"
p /cat/ =~ "Cat"

p /cat/.match?("dog and cat")
p /cat/.match?("catch")
p /cat/.match?("Cat")

str = "cat and dog"

if str.match?(/cat/)
    puts "There is a cat here somewhere."
end

File.foreach("mechanical_pencils.txt").with_index do |line, index|
    puts "#{index}: #{line}" if line.match?(/on/)
end

File.foreach("mechanical_pencils.txt").with_index do |line, index|
    puts "#{index}: #{line}" if line !~ /on/
end

str = "Dog and Cat"
new_str = str.sub(/Cat/, "Gerbil")
puts "Let's go to the #{new_str} for a pint."

new_str1 = str.sub(/a/, "*")
new_str2 = str.gsub(/a/, "*")
puts "Using sub: #{new_str1}"
puts "Using gsub: #{new_str2}"

str = "now is the time"
str.sub!(/i/, "*")
str.gsub!(/t/, "T")
puts str

str = "dog and cat"
pattern = /nd/
p pattern.match?(str)
p str.match?(pattern)

city_state_zip = %r{
    (\w.*), # city name followed by a comma
    \s # a space
    ([A-Z][A-Z]) # a two character state abbreviation
    \s # a space
    (\d{5}) # 5 digits for the simple US zip code
}x

p "Chicago, IL 60601".match?(city_state_zip)

name = "Fats Waller"
p name =~ /a/
p name =~ /z/
p /a/ =~ name
p /a/.match(name)
p Regexp.new("all").match(name)

p "Faster than a speeding bullet" =~/speed/
p $~
p $&
p $`
p $'

match_data = "Faster than a speeding bullet".match(/speed/)
p match_data
p match_data[0]
p match_data.pre_match
p match_data.post_match

def show_regexp(string, pattern)
    match = pattern.match(string)
    if match
        p "#{match.pre_match}--->  #{match[0]}  <--- #{match.post_match}"
    else
        "no match"
    end
end

p show_regexp('very interesting', /t/)
p show_regexp('Fats Waller', /lle/)
p show_regexp('Fats Waller', /z/)

p show_regexp('yes | no', /\|/)
p show_regexp('yes (no)', /\(no\)/)
p show_regexp('are you sure?', /e\?/)

str = "this is\nthe time"
p show_regexp(str, /^the/)
p show_regexp(str, /is$/)
p show_regexp(str, /\Athis/)
p show_regexp(str, /\Athe/)

p "six o'clock".gsub(/\b/, "*")
p "six o'clock".gsub(/\B/, "*")

p show_regexp("this is\nthe time", /\bis/)
p show_regexp("this is\nthe time", /\Bis/)

p show_regexp("Price $ 12.", /[aeiou]/)
p show_regexp("Price $ 12.", /[0123456789]/)
p show_regexp('Price $ 12.', /[$.]/)

a = "see [The PickAxe-page 123]"
show_regexp(a, /[A-F]/)
show_regexp(a, /[A-Fa-f]/)
show_regexp(a, /[0-9]/)
show_regexp(a, /[0-9][0-9]/)

price = "Price $12."
show_regexp(price, /[^A-Z]/)
show_regexp(price, /[^\w]/)
show_regexp(price, /[a-z][^a-z]/)
show_regexp(price, /\s/)
show_regexp(price, /\d/)

show_regexp(a, /[\]]/)
show_regexp(a, /[0-9\]]/)
show_regexp(a, /[\d\-]/)

b = "It costs $12."
show_regexp(b, /c.s/)
show_regexp(b, /./)
show_regexp(b, /\./)

c = "This moon is made of cheese"
show_regexp(c, /\w+/)
show_regexp(c, /\s.*\s/)
show_regexp(c, /\s.*?\s/)
show_regexp(c, /[aeiou]{2,99}/)
show_regexp(c, /mo?o/)
show_regexp(c, /mo??o/)

# the asterisk means 0 or more, so show_regexp will return an empty substring at the start of the string
show_regexp(c, /m*/)
# if you use + instead of *, it will match 1 or more m's
show_regexp(c, /m+/)

d = "red ball blue sky"
show_regexp(d, /d|e/)
show_regexp(d, /al|lu/)
show_regexp(d, /red ball|angry sky/)
show_regexp(d, /yellow ball|blue sky/)

show_regexp('banana', /an+/)
show_regexp('banana', /(an)+/)

show_regexp(d, /blue|red/)
show_regexp(d, /(blue|red) \w+/)
show_regexp(d, /(red|blue) \w+/)
show_regexp(d, /red|blue \w+/)
show_regexp(d, /red (ball|angry) sky/)

e = "the red angry sky"
show_regexp(e, /red (ball|angry) sky/)

/(\d\d):(\d\d)(..)/ =~ "12:50am"
puts "Hour is #$1, minute #$2"
/((\d\d):(\d\d))(..)/ =~ "12:50am"
puts "Time is #$1"
puts "Hour is #$2, minute #$3"
puts "AM/PM is #$4"

md = /(\d\d):(\d\d)(..)/.match("12:50am")
puts "Hour is #{md[1]}, minute #{md[2]}"

md = /((\d\d):(\d\d))(..)/.match("01:35pm")
p md
puts "Time is #{md[1]}"
puts "Hour is #{md[2]}"
puts "AM/PM is #{md[4]}"

show_regexp('He said "Hello"', /(\w)\1/)
show_regexp('Mississippi', /(\w+)\1/)

str = 'He said "Hello"'
show_regexp(str, /(?<char>\w)\k<char>/)

str = "Mississippi"
show_regexp(str, /(?<seq>\w+)\k<seq>/)

/(?<hour>\d\d):(?<min>\d\d)(..)/ =~ "12:50am"

puts "Hour is #{hour}, minute #{min}"
puts "Hour is #{hour}, minute #{$2}"

md = /(?<hour>\d\d):(?<min>\d\d)(..)/.match("12:50am")
puts "Hour is #{md[:hour]}, minute #{md[:min]}"

g = "quick brown fox"
puts g.sub(/[aeiou]/, "*")
puts g.gsub(/[aeiou]/, "*")
puts g.sub(/\s\S+/, "")
puts g.gsub(/\s\S+/, "")

puts g.sub(/^./) {|match| match.upcase }
puts g.gsub(/[aeiou]/) {|vowel| vowel.upcase}

def mixed_case(name)
    # you could replace the block with {_1.upcase} or just name.downcase.gsub(/\b\w/, &:upcase)
    puts name.downcase.gsub(/\b\w/) { |first| first.upcase}
end

mixed_case("NEW YORK")
mixed_case("new york")
mixed_case("nEw yOrk")

replacement = {"cat" => "feline", "dog" => "canine"}
replacement.default = "unknown"

puts "cat and dog".gsub(/\w+/, replacement)

puts "fred:smith".sub(/(\w+):(\w+)/, '\2, \1')
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')

puts "fred:smith".gsub(/(?<first>\w+):(?<last>\w+)/, '\k<last>, \k<first>')
puts "nercpyitno".gsub(/(?<c1>.)(?<c2>.)/, '\k<c2>\k<c1>')

str = 'a\b\c'
puts str.gsub(/\\/, '\\\\\\\\')
puts str.gsub(/\\/, '\&\&')
puts str.gsub(/\\/) { '\\\\' }