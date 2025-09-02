# Letra a)
def palindrome?(string)
  clean = string.downcase.gsub(/[^a-z]/, "")
  clean == clean.reverse
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")


# Letra b)
def count_words(string)
  words = string.downcase.gsub(/[^a-z\s]/, "").split
  counts = Hash.new(0)
  words.each { |word| counts[word] += 1 }
  counts
end

puts count_words("A man, a plan, a canal -- Panama")
puts count_words("Doo bee doo bee doo")