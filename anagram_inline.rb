require "optparse"

require "bundler/inline"

gemfile do
    source "https://rubygems.org"
    gem "date_by_example"
end

dictionary = "/home/chip/repos/pickaxe/words_alpha.txt"

OptionParser.new do |opts|
    opts.banner = "Usage: anagram [ options ] word..."

    opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
        dictionary = dict
    end

    opts.on("-h", "--help", "Show this message") do
        puts opts
        exit
    end

    begin
        ARGV << "-h" if ARGV.empty?
        opts.parse!(ARGV)
    rescue OptionParser::ParseError => e
        warn e.message, "\n", opts
        exit(-1)
    end
end

def signature_of(word)
    word.unpack("c*").sort.pack("c*")
end

signatures = {}

File.foreach(dictionary) do |line|
    word = line.chomp
    signature = signature_of(word)
    (signatures[signature] ||= []) << word
end

puts "Anagram Report for #{Date.today.by_example("Jan 02, 2006")}"

ARGV.each do |word|
    signature = signature_of(word)
    if signatures[signature]
        puts "Anagrams of #{word}: #{signatures[signature].join(", ")}"
    else
        puts "No anagrams of #{word} in #{dictionary}"
    end
end



