class Array
  def binary_search(target)
    middle_idx = self.length / 2 

    case self[middle_idx] <=> target
    when 0
      middle_idx
    when 1
      self.take(middle_idx).binary_search(target)
    when -1
      right_idx = self.drop(middle_idx + 1).binary_search(target)
      right_idx.nil? ? nil : right_idx + middle_idx + 1
    end
  end
end
