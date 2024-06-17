require "optparse"

parser = OptionParser.new

sort_type = nil
parser.on("-a", "Alphabetical") do
    sort_type = :alphabetical
end

parser.on("--recent", "Most Recent") do
    sort_type = :recency
end

parser.on("-s", "--size", "Size") do
    sort_type = :size
end

parser.parse!

p "we are sorting by #{sort_type}"