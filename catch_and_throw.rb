word_list = File.open("ordinals.txt")
word_in_error = catch (:done) do
    result = []
    while line = word_list.gets
        word = line.chomp
        throw(:done, word) unless word =~ /^\w+$/
        result << word
    end
    puts result.reverse
end
if word_in_error
    puts "Failed: '#{word_in_error}' found, but a regular word was expected"
end
