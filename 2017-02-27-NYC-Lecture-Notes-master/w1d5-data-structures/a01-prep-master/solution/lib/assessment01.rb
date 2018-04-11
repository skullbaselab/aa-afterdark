require 'byebug'

class Array
  # def my_inject(accumulator = nil, &block)
  #   # real #inject takes a symbol as well
  #   i = 0
  #
  #   if accumulator.nil?
  #     accumulator = self.first
  #     i += 1
  #   end
  #
  #   (i...self.length).each do |idx|
  #     accumulator = block.call(accumulator, self[idx])
  #   end
  #
  #   accumulator
  # end

  def my_inject(accumulator = nil, &block)
    copy = self.dup
    if accumulator.nil?
      accumulator = copy.shift # this is destructive to the original array
    end

    # accumulator ||= copy.shift

    copy.each do |el|
      accumulator = block.call(accumulator, el)
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
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

class Array
  def dups
    positions = Hash.new do |h, k|
      h[k] = [] # h refers to the hash we're creating here
    end # important syntax for default hash value!
    # Hash.new([]) => BAD BAD BAD
    # Hash.new(0) => totally fine, but not useful here
    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end

class String
  def symmetric_substrings
    symm_subs = []

    length.times do |start_pos| # goes from 0 to the length - 1
      (2..(length - start_pos)).each do |len|
        substr = self[start_pos...(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

class Array
  def merge_sort(&prc) # in definition, '&' tells it to expect a block
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y } # our reasonable default
    # Proc.new { |x, y| x ** 2 <=> y ** 2 }

    return self if count <= 1 # base case

    midpoint = count / 2
    left = self.take(midpoint)
    right = self.drop(midpoint)
    # sorted_left = self.take(midpoint).merge_sort(&prc) # remember to keep passing the proc along!
    # sorted_right = self.drop(midpoint).merge_sort(&prc) # in invocation, '&' passes a proc

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)

  end

  private
  def self.merge(left, right, &prc)
    # class method because it doesn't belong to any specific instance
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

  def merge(left, right, &prc)
    # if we made it an instance method, it doesn't use self, so it doesn't make semantic sense
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
        merged << right.shift # micro optimization!
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

p (-5..5).to_a.shuffle.merge_sort { |x, y| y <=> x }
