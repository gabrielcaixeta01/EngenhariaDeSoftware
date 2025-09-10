def palindrome?(string)
  new_s = string.downcase.gsub(/[^a-z]/, "")
  new_s == new_s.reverse
end

puts palindrome?("Ana")