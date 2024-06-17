require "optparse"

parser = OptionParser.new("Demo 0.0.0: A demonstration CLI.", 40, "  ") do |act|
    act.separator "\nUSAGE"
    act.on("--echo TEXT", "Echoes input as output.") { |value| puts value }
end

parser.parse! %w[--echo hi]

parser_two = OptionParser.new do |act|
    act.on(
        "-c",
        "--config ACTION",
        Array,
        %w[edit view],
        "Manage configuration.",
        %(Actions: #{%w[edit view].join(", ")})
    ) do |value|
        puts value
    end
end

#parser_two.parse! ["--help"]

parser_three = OptionParser.new do |act|
    act.on("-m") {puts "Monitoring..."}
    act.on("--build") { puts "Building..."}
    act.on("-g", "--generate") {puts "Generating..."}
end

#parser_three.parse! %w[-m --build --generate]

parser_four = OptionParser.new do |act|
    act.on("--[no-]build") {|value| puts value}
end 

#parser_four.parse!

parser_five = OptionParser.new do |act|
    act.on("--name TEXT") {|text| puts "Name: #{text}" }
    act.on("--label [TEXT]") {|text = "Unknown"| puts "Label: #{text}" }
end

parser_five.parse! %w[--name demo --label]