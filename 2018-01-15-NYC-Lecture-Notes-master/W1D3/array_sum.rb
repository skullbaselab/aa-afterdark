require 'byebug'

#recursive algorithm to find the sum of the numbers in the array
def sum(array)

  #base case(s)
  return 0 if array.empty?
  return array[0] if array.length == 1

  #inductive step
  current_num = array[0]
  prev_num = sum(array[1..-1])

  
  current_num + prev_num

end
