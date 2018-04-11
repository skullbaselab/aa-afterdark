require 'byebug'

# RECURSION!

def recurse
  puts "Recursive call!"
  recurse
end

# What two things do we need to write a useful recursive method?
# 1. Base Case
# 2. Inductive Step

# return array containing the first n fibs
# first_n_fibs(1) => [0]
# first_n_fibs(2) => [0, 1]
# first_n_fibs(3) => [0, 1, 1]
# first_n_fibs(5) => [0, 1, 1, 2, 3]
# first_n_fibs(10) => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
#


def fibs(count)
  puts count
  return nil if count < 0
  return [] if count == 0
  return [0] if count == 1
  return [0, 1] if count == 2


  # count = 3
  # fibs(2) = [0, 1]
  # fibs(count - 1)[-1] = 1
  # fibs(count - 1)[-2] = 0
  # 1 + 0 = 1
  # fibs(2) << 1 = [0, 1, 1]

  # count = 4
  # fibs(3) = [0, 1, 1]
  # fibs(3) << 1 + 1 = [0, 1, 1, 2]

  # Too many recursive calls; This breaks at count == 20
  last = fibs(count - 1)[-1]
  tooth = fibs(count - 1)[-2]
  prev_fibs = fibs(count - 1)


  prev_fibs << (last + tooth)
end

def better_fibs(count)
  # debugger
  return nil if count < 0
  return [] if count == 0
  return [0] if count == 1
  return [0, 1] if count == 2
  # debugger

  # less recursive calls, much better

  prev_fibs = better_fibs(count - 1)
  # debugger
  prev_fibs << (prev_fibs[-1] + prev_fibs[-2])
end

class Array
  # recursive sorting algorithm
  def quicksort
    # base case
    # debugger
    return self if self.length <= 1

    # inductive step
    pivot = self.first

    lesser = self[1..-1].select { |num| num <= pivot }
    greater = self[1..-1].select { |num| num > pivot }
    # debugger

    sorted_lesser = lesser.quicksort
    # debugger
    sorted_greater = greater.quicksort
    # debugger

    sorted_lesser + [pivot] + sorted_greater

  end
end

# Any iterative algorithm can be written recursively, and any recursive
# algorithm can be written iteratively
class Array
  def my_each(&prc)
    self.length.times { |i| prc.call(self[i]) }
  end

  def my_each_rec(&prc)
    return self if self.length.zero?

    prc.call(self.first)
    self.drop(1).my_each_rec(&prc)

    self

  end
end
#
# def digital_root(num)
#   num < 10 ? num : digital_root(digital_root(num / 10) + (num % 10))
# end
