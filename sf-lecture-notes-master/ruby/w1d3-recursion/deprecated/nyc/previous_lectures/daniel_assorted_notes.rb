## Recursion ##

# Dividing a problem into smaller problems of the same type
#
# A function that calls itself:

def recurse
  recurse
end
#
# * identify a base case(s) (harcode it!)
# * move up one level (use base case to get next) - repeat as necessary
# * generalize -> reduction toward base case


# movie theater example (modified)
#
# How many people are in line? (write out the call stack as they go)
# - Iterative involves me walking and counting (but I am too lazy)
# - Recursive -> ask the person how many are behind you, wait for response and add 1 (pass along a piece of paper)
# - hardcode last person (by giving them the marker)


# fibs

def fibs(n)
  return [0, 1].take(n) if n <= 2

  previous_fibs = fibs(n - 1)
  next_fib = previous_fibs[-1] + previous_fibs[-2]

  previous_fibs << next_fib
end
#
# base case? -> case that doesn't use recursion
# how can I use base case to solve the next one up?
# generalize
# draw stack at each stage
#
# * save recursive call to a variable
# * make sure you return the right kind of thing! - whatever base case returns is what all calls should return
# * no base case -> stack overflow

def quicksort(array)
  return array if array.length <= 1

  pivot_index = array.length / 2
  pivot_value = array[pivot_index]

  lesser = []
  greater = []

  array.each_with_index do |el, i|
    next if i == pivot_index
    if el <= pivot_value
      lesser << el
    else
      greater << el
    end
  end

  quicksort(lesser) + [pivot_value] + quicksort(greater)
 end

# google recursion
