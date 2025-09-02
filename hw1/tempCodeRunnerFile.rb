def palindrome?(string)
  clean = string.downcase.gsub(/[^a-z]/, "")
  clean == clean.reverse
end