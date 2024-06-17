def approximate_word_count(sentence)
    sentence.split(/\W+/).size
end

approximate_word_count("This is a sample sentence")