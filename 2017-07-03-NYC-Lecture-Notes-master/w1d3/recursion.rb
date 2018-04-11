require 'byebug'
require 'faker'

def hey_you(array)
  # v the base case
  #debugger
  return 1 if array.length == 1   #Hey, you
  # debugger                       #If there's nobody behind you, just say one
  count = hey_you(array.drop(1))  #Otherwise, read these same instructions to the person behind you
  # debugger                       #Wait until they give you a number
  count += 1                      #When they give you a number, add one for yourself
  count                           #Then tell me that total.
end

class Hipster
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def inspect
    self.name
  end
end

line = Array.new(4) { Hipster.new(Faker::Hipster.word) }
# p line
# puts hey_you(line)

# fibs - the first two are 0 & 1 (or 1 & 1, depends who you ask)
# every following number is the sum of the last two before it
def joker_fibs(n)
  if n == 2
    return [0, 1]
  end

  penultimate = joker_fibs(n - 1)[-2]
  ultimate = joker_fibs(n - 1)[-1]

  joker_fibs(n - 1) << (penultimate + ultimate)
end

def batman_fibs(n)
  if n == 2
    return [0, 1]
  end

  prev_fibs = batman_fibs(n - 1)
  prev_fibs << (prev_fibs[-2] + prev_fibs[-1])

  # if you need to call a recursive method multiple times
  # you should just store the return of the recursive call in a variable
  # rather than make multiple calls.
  # ie, I know that fibs(3) will always return [0, 1, 1], so instead of calling
  # the method three times and doing all that work, I can just do it once and save
  # [0, 1, 1] to a variable. :-)
end

class Array
  # the plan - pick a number from a list,
  # sort the numbers less than that on the left, greater than that on the right
  # ad nauseum
  # base case? an array of length 1 or 0 is already sorted
  def quicksort
    return self if self.length <= 1

    pivot = self.first
    # NB Avoid mutating the thing you've called a method on
    # that's why we're not using something like Array.shift
    less_than = self.drop(1).select { |el| el <= pivot }
    greater_than = self.select { |el| el > pivot }

    less_than.quicksort + [pivot] + greater_than.quicksort
  end

  # & in a method definition 'proc-ifies' a block
            # v
  def my_each(&prc)
    return self if self.empty?

    prc.call(self.first)
    self.drop(1).my_each(&prc)
    #                     ^
    #        & in a method call 'block-ifies' a proc

    return self
  end
end
