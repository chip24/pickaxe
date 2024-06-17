require "optparse"

parser = OptionParser.new

parser.on("-x") do
    puts "yep, do the x thing"
    true
end

parser.on("-yTYPE", "--y") do |value|
    puts "There's a y with #{value}"
    value
end

options = {}
parser.parse!(into: options)

p ARGV
p options