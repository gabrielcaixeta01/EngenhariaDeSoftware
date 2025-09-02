def combine_anagrams(words)
  anagrams = Hash.new { |hash, key| hash[key] = [] }
  words.each do |word|
    sorted = word.chars.sort.join
    anagrams[sorted] << word
  end
  anagrams.values
end

p combine_anagrams(["cars", "for", "potatoes", "racs", "four", "scar", "creams", "scream"])