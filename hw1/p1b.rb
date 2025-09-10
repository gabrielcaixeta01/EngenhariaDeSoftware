def count_words(string)
    words = string.downcase.gsub(/[^a-z\s]/, "").split
    counts = Hash.new(0)
    words.each { |word| counts[word] += 1 }
    counts
end

puts count_words("A man, a plan, a canal -- Panama")