def recurse
  recurse
end

def fibs(n)
  return [0, 1].take(n) if n <= 2

  # return [] if n <= 0
  # return [0] if n == 1
  # return [0, 1] if n == 2

  previous_fibs = fibs(n - 1)

  next_fib = previous_fibs[-1] + previous_fibs[-2]

  previous_fibs + [next_fib]

end
