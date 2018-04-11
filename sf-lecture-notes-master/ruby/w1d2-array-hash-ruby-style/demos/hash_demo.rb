THIS_IS_A_CONSTANT = 123

str = "this is a long string I want to count all of the letters in this string"

empty_str = ""
char_counts = Hash.new do |the_hash, missing_key|
  the_hash[missing_key] = empty_str
end

str.each_char do |c|
  # char_counts[c] += 1
  # str = char_counts[c]
  # str << "i"
  # char_counts[c] = char_counts[c] + "i"

  char_counts[c] << "i"
end

puts char_counts
