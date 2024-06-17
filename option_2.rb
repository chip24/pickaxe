require "optparse"

parser = OptionParser.new

sort_type = nil

parser.on("-sSort", "Sort Type") do |value|
    sort_type = value
end

parser.on("-a [DIR]", "alphabetical") do |value|
    sort_type = :alphabetical
end

parser.on("--recent DATE", "Most Recent") do
    sort_type = :recency
end

parser.on("-h", "--height [METRIC]", "Height") do 
    sort_type = :size
end

parser.parse!

p "we are sorting by #{sort_type}"