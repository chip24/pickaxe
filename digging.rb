data = {
    mcu: [
    {name: "Iron Man", year: 2010, actors: ["Robert Downey Jr.", "Gwyneth Paltrow"]}
    ],
    starwars: [
    {name: "A New Hope", year: 1977, actors: ["Mark Hamill", "Carrie Fisher"]}
    ]
    }

    p data[:mcu][0][:actors][1]
    p data.dig(:mcu, 0, :actors, 1)

    def words_from_string(string)
        @word_array = string.downcase.scan(/[\w']+/)
    end

    words_from_string("I like Ruby, it is (usually) optimized for programmer happiness")

    p @word_array

    def count_frequency(word_list)
        counts = Hash.new(0)
        word_list.each do |word|
            counts[word] += 1
        end
        p counts
    end

    count_frequency(@word_array)
    count_frequency(["sparky", "the", "cat", "sat", "on", "the", "mat"])

raw_text = "The problem breaks down into two parts. First, given some text
as a string, return a list of words. That sounds like an array. Then, build
a count for each distinct word. That sounds like a use for a hash---we can
index it with the word and use the corresponding entry to keep a count."

word_list = words_from_string(raw_text)
counts = count_frequency(word_list)
p counts
sorted = counts.sort_by {|word, count| count }
p sorted
top_five = sorted.last(5)
top_five.reverse_each do |word,count|
    puts "#{word}: #{count}"
end