require 'byebug'

def first_n_fibs(n)
  # return an array containing the first n fib nums
  # recursive stuff here

  # Two base cases! When n is 1 or 2: (assuming good input)
  debugger
  case n
  when 1
    return [1]
  when 2
    return [1, 1]
  end

  # inductive step (n > 2)
  prev_fibs = first_n_fibs(n - 1) # store [1,1,2,3], for example, if n-1 == 4
  debugger
  prev_fibs + [prev_fibs[-2] + prev_fibs[-1]] # doesn't mutate
  # prev_fibs << (prev_fibs[-2] + prev_fibs[-1]) # mutates (fine here, avoid in general)
end

p  first_n_fibs(5)
