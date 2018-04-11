require 'byebug'

class Array
def merge_sort(&prc) # Procifies the block
  return self if self.count <= 1

  middle = self.length / 2
  left = self[0...middle]
  right = self[middle..-1]

  sorted_left = left.merge_sort(&prc)
  sorted_right = right.merge_sort(&prc)
  # Preferred method as this scales with changing
  # the name of the class
  self.class.merge(sorted_left, sorted_right, prc)
  # Array.merge(sorted_left, sorted_right, prc)
end

private
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
