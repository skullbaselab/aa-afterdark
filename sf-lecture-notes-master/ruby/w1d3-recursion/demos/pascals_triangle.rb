# Bad solution
# This one doesn't use memoization. 
# It won't get past row 9.

def pascal(num)
  return nil if num < 0
  return [1] if num == 0

  row = [1]

  pairs = pascal(num - 1).length - 1

  pairs.times do |i|
    row << pascal(num - 1)[i] + pascal(num - 1)[i + 1]
  end

  row + [1]
end

# test
# Change 6 to 15 to watch this one fail
6.times do |i|
  print "#{i}: "
  p pascal(i)
end



# Good solution
# This one does use memoization. 
# It can easily do thousands of rows.
  
def pascal2(num)
  return nil if num < 0
  return [1] if num == 0

  row = [1]

  prev_row = pascal2(num - 1)
  pairs = prev_row.length - 1

  pairs.times do |i|
    row << prev_row[i] + prev_row[i + 1]
  end

  row + [1]
end

# test
# 15.times do |i|
#   print "#{i}: "
#   p pascal2(i)
# end
