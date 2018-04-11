# Solutions excerpt (bracket methods)

# Same thing as [](pos) method
def get_card(pos)
  x,y = pos
  rows[x][y]
end

# b = Board.new
# # All three below are the same
# b.get_card([1,2])
# b.[]([1,2])
# b[[1,2]]

def [](pos)
  # Destructuring an array
  x, y = pos
  rows[x][y]
end

def []=(pos, value)
  x, y = pos
  rows[x][y] = value
end

# Lecture

# Q: What is a recursive method?
# A: A method that calls itself!!

# Q: What 2 things does every recursive method need?
# A: Base case and the inductive step!!!

# returns the nth fibonacci number
def fibs(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs(n-1) + fibs(n-2)
end

# returns the first n fibonacci numbers
def fibs(n)
  return [0] if n <= 1
  return [0,1] if n == 2
  # Making a recursive call more than once is too much computation
  # fibs(n-1).push(fibs(n-1)[-1] + fibs(n-1)[-2])
  prev_fibs = fibs(n-1)
  prev_fibs.push(prev_fibs[-1] + prev_fibs[-2])
end

# QUICKSORT =========================
# 1) Pick number
# 2) Use it to split numbers into lesser than and greater than arrays
# 3) Call quicksort on the lesser than and greater than arrays
# 4) Base case is an array of length  <= 1
# 5) Join the quicksorted lesser than array, the middle array (pivot), and the
# quicksorted greater than array

# Quiz question 2
# Only 1 options hash at the end
# {} is the default (useful if we don't pass in 3rd arg)
# def args_matey(word, arr, options = {})
#   options[:last]
# end
