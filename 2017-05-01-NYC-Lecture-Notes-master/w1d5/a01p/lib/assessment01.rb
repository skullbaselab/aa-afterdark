# my_inject, symmetric_substrings, merge_sort
require 'byebug'

class Array
  def my_inject(accumulator = nil, &block)
    # debugger
    i = 0

    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end

    accumulator
  end
end

# [3, 5, 2, 6, 2].my_inject(2) { |accum, el| accum + el }

def is_prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(count)
  primes = []

  i = 2
  until primes.count >= count
    primes << i if is_prime?(i)

    i += 1
  end

  primes
end

# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  # debugger
  if num == 1
    [1]
  else
    # debugger
    facs = factorials_rec(num - 1)
    # debugger
    facs << facs.last * (num - 1)
    # debugger
    facs
  end
end

factorials_rec(4)

class Array
  def dups
    # to prevent mutation of the default array
    # h refers to the hash itself
    # The hash, at whatever key you give it, will default to []
    # This syntax is for CREATION of a hash.
    #

    positions = Hash.new { |h, k| h[k] = [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end

class String
  def symmetric_substrings
    symm_subs = []

    length.times do |start_pos|
      (2..(length - start_pos)).each do |len|
        # debugger
        substr = self[start_pos...(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

# "banana".symmetric_substrings

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }
    # debugger
    return self if count <= 1

    midpoint = count / 2
    # debugger
    sorted_left = self.take(midpoint).merge_sort(&prc)
    # debugger
    sorted_right = self.drop(midpoint).merge_sort(&prc)
    # debugger

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    # debugger
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    # debugger

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

[3, 7, 5, 6, 4, 2, 1].merge_sort
