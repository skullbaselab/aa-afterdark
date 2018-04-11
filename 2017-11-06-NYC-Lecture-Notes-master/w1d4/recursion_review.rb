require 'byebug'
class Array
# for sorting ascending:
# { |x, y| x <=> y }

# for sorting descending:
# { |x, y| y <=> x }

  def quicksort(&prc)
    # Default sorting order in case no block is given
    # Using lazy assignment so prc is set to whatever returns truthy first
    prc ||= Proc.new { |x, y| x <=> y }
    # Above is shorthand for below
    # prc = prc || Proc.new { |x, y| x <=> y }
    return self if self.length <= 1

    pivot = self.first

    left = self.drop(1).select { |el| prc.call(el, pivot) == -1 }
    right = self.drop(1).select { |el| prc.call(el, pivot) >= 0 }
    # Below have to turn proc back into a block with &
    left.quicksort(&prc) + [pivot] + right.quicksort(&prc)
  end


  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new { |x, y| x <=> y }

    middle_idx = self.length / 2

    left = self.take(middle_idx)
    right = self.drop(middle_idx)

    self.class.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result.push(left.shift)
      when 0, 1
        result.push(right.shift)
      end
    end

    result + left + right
  end



end
