# Solutions extract:

def [](pos)
  row, col = pos
  grid[row][col]
end

# splat in a method definition gathers multiple arguments into one array
# (splatted argument must be the last argument)
def [](*pos)
  row, col = pos
  grid[row][col]
end

solution bracket method: board[[1, 2]] #board[pos]
splatting bracket method: board[1, 2]  #board[*pos]
# splat in a method call separates an array into multiple individual arguments

# RECURSION!

# Function that calls itself

# Base case
  # trivial, hardcoded solution that stops the recursion
# Inductive step
  # Make the problem smaller
  # combine smaller call with next piece of the problem

def fib(n)
  return 0 if n == 1
  return 1 if n == 2

  fib(n - 1) + fib(n - 2)
end

# fibs(5) calls fibs(4) AND fibs(3)
# fibs(4) calls fibs(3) AND fibs(2)
# etc.


def first_n_fibs(n)
  # case n
  # when 1
  #   return [0]
  # when 2
  #   return [0, 1]

  puts "first_n_fibs #{n}"

  if n == 1
    return [0]
  elsif n == 2
    return [0, 1]
  else
    prev_fibs = first_n_fibs(n - 1)
    puts "first_n_fibs #{n}"
    # assuming fibs(4) gives me [0, 1, 1, 2]

    # how do I get fibs(5) from fibs(4) -> [0, 1, 1, 2, 3]
    # prev_fibs is [0, 1, 1, 2]
    # prev_fibs[-1] is 2
    # prev_fibs[-2] is 1
    # 2 + 1 = 3
    # push 3 to the end of prev_fibs
    prev_fibs << prev_fibs[-1] + prev_fibs[-2]
    # first_n_fibs(n - 1) << first_n_fibs(n - 1)[-1] + first_n_fibs(n - 1)[-2] #BAAADDDDD
    # Always store recursive call in a variable!!!!!!
  end
end

# to figure out inductive step: assuming fibs(4) works, how would I get fibs(5)



### quicksort

# 1) pick first element of array (pivot)
# 2) make array with elements less than pivot (left)
# 3) another with elements greater than or equal to the pivot (right)
# 4) quicksort left + [pivot] + quicksort right

# base case -> array with length <= 1 is already sorted


[9, 3, 18, 42, 7, 0]

pivot = 9
left = [3, 7, 0]
right = [18, 42]

------------------------
# quicksort left:
pivot = 3
left = [0] #sorted!
right = [7] #sorted!

left + [pivot] + right
[0] + [3] + [7]

# quicksort right:
pivot = 18
left = []
right = [42]

left + [pivot] + right
[] + [18] + [42]
------------------------

left + [pivot] + right
[0, 3, 7] + [9] + [18, 42]
