require 'byebug'

class Array
  # this is an instance method.
  # definitions without the self in front are instance methods.
  def merge_sort(&prc) # Procifies the block
    return self if self.count <= 1

    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, prc)
  end

  private
  # the below is a class method.
  # definitions with the self in front are class methods.
  def self.merge(left, right, prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) <= 0
        result << left.shift
      else
        result << right.shift
      end
    end

    result + left + right
  end
end
