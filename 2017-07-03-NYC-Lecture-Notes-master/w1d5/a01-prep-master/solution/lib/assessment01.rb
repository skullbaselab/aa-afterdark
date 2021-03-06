class Array
  def my_inject(accumulator = nil, &block)
    # i = 0
    dup_array = self.dup

    if accumulator.nil?
      accumulator = dup_array.shift
      # i += 1
    end

    # while i < length
    dup_array.each do |el|
      accumulator = block.call(accumulator, el)
      # i += 1
    end

    accumulator
  end
end



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
  return [] if num < 1
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

# factorials_rec(3) == [1, 1, 2]
# 3 >> facs = [1, 1], [1, 1] << (1 * 2), return [1, 1, 2]
# 2 >> facs = [1], [1] << (1*1), return [1, 1]
# 1 >> return [1]


class Array
  def dups
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
        substr = self[start_pos...(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  def self.merge(left, right, &prc)
    merged = []

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

    merged.concat(left)
    merged.concat(right)

    merged
  end

  def quicksort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if self.length < 2

    pivot_idx = self.length / 2
    pivot = self[pivot_idx]

    left = []
    right = []

    self.each_with_index do |el, idx|
      next if idx == pivot_idx

      if prc.call(el, pivot) == -1
        left << el
      else
        right << el
      end
    end

    sorted_left = left.quicksort(&prc)
    sorted_right = right.quicksort(&prc)

    sorted_left + [pivot] + sorted_right
  end
end
