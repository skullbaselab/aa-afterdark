require 'byebug'


def bad_fib(n)

  #base case(s)
  return [0] if n == 0
  return [0, 1] if n == 1

  #inductive step
  prev_seq = bad_fib(n - 1)
  last = bad_fib(n - 1)[-1]
  second_to_last = bad_fib(n - 1)[-2]

  prev_seq << last + second_to_last
end

def good_fib(n)

  #base case(s)
  return [0] if n == 0
  return [0, 1] if n == 1

  #inductive step
  # Memoization: is when we store the result of an expensive calculation
  # in a variable
  prev_seq = good_fib(n - 1) #<-- memoization

  last = prev_seq[-1]
  second_to_last = prev_seq[-2]

  prev_seq << last + second_to_last
end















#end
