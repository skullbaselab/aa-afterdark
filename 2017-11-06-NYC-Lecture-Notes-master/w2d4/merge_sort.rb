class Array
  def merge_sort
    return self if length <= 1

    middle_idx = length / 2
    left = take(middle_idx)
    right = drop(middle_idx)
    # merge is called log n times
    # merge_sort gets called twice(left and right) but each get called log n times
    # log n + log n => 2 * log n => log n
    self.class.merge(left.merge_sort, right.merge_sort)
  end

  def self.merge(left, right)
    # each merge takes n steps
    merged = []

    until left.empty? || right.empty?
      if left.first < right.first
        merged << left.shift
      else
        merged << right.shift
      end
    end

    merged + left + right
  end
end
