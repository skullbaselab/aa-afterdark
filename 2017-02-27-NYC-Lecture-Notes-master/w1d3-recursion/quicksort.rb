require 'byebug'

def quicksort(arr)
  debugger
  return arr if arr.length <= 1

  pivot = arr.first
  left = arr.drop(1).select { |el| el <= pivot }
  right = arr.drop(1).select { |el| el > pivot }
  debugger
  quicksort(left) + [pivot] + quicksort(right)
end

p quicksort([4,3,1,5,2])

def func(arg1, arg2)
  temp = arg1 * arg2
  return_val = (temp ** 2) + (arg1 % 6 + 1) / (7 + arg2 + arg1)
end
