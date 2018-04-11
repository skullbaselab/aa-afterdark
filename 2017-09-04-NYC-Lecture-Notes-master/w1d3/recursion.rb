require 'byebug'
# RECURSION!

def recurse
  puts "Recursive call!"
  recurse
end

# What do we need to write a useful recursive method?
# 1. base case
# 2. inductive step

# return array containing the first n fibs
# first_n_fibs(1) => [0]
# first_n_fibs(2) => [0, 1]
# first_n_fibs(3) => [0, 1, 1]
# first_n_fibs(5) => [0, 1, 1, 2, 3]
# first_n_fibs(10) => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
def fibs(count)
  # debugger
  # return [0] if count == 1
  # return [0, 1] if count == 2
  # return [] if count <= 0
  # We can do better:
  return [0, 1].take(count) if count <= 2

  first_prev_fib = fibs(count - 1)[-1]
  # debugger
  second_prev_fib = fibs(count - 1)[-2]
  # debugger
  prev_fibs = fibs(count - 1)
  prev_fibs.push(first_prev_fib + second_prev_fib)


  # fibs(count - 1).push(fibs(count - 1)[-1] + fibs(count - 1)[-2])
  # This is super slow.
end

def better_fibs(count)
  return [0, 1].take(count) if count <= 2
  prev_fibs = better_fibs(count - 1)
  prev_fibs.push(prev_fibs[-1] + prev_fibs[-2])
end

class Array
  # for convenience
  def sorted?
    # each_cons(2) looks at each consecutive 2 elements of self
    self.each_cons(2).all? { |a, b| a <= b }
  end

  def quicksort
    return [] if self.empty?
    pivot = self.shift
    left = self.select { |el| el < pivot }
    right = self.select { |el| el >= pivot }
    left.quicksort + [pivot] + right.quicksort
  end
end

# Any iterative algorithm can be written recursively, and any recursive
# algorithm can be written recursively
class Array
  def my_each(&prc)
    self.length.times { |i| prc.call(self[i]) }
  end

  def my_each_rec(&prc)
    # We return nil if self is empty.
    return if self.empty?
    prc.call(self.shift)
    my_each_rec(&prc)
  end
end

# for your entertainment
def digital_root(num)
  num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))
end

def multiply(a, b)
  (a == 0 || b == 0) ? 0 : a + multiply(a, b - 1)
end

# fibs(5)
