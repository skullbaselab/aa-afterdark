class Array
  def my_each(&banana)
    self.length.times do |i|
      banana.call(self[i])
    end

    self
  end

  # arr = [1, 2, 3]
  # arr.my_each { |el| el * 2 }

  def my_select(&prc)
    selects = []

    self.my_each do |item|
      selects << item if prc.call(item)
    end

    selects
  end

  def my_reject(&prc)
    selects = []

    self.my_each do |item|
      selects << item unless prc.call(item)
    end

    selects
  end

  def my_any?(&prc)
    self.my_each do |item|
      return true if prc.call(item)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |item|
      return false unless prc.call(item)
    end

    true
  end

  def my_flatten
    flattened = []

    self.my_each do |el|
      if el.is_a?(Array)
        # Use concat here instead of << in order to prevent nesting arrays
        # += would do the same thing, but not mutate the array
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end

    flattened
  end

  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end

    zipped
  end

  def my_rotate(positions = 1)
    split_idx = positions % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separator = "")
    join = ""

    self.length.times do |i|
      join += self[i]
      join += separator unless i == self.length - 1
    end

    join
  end

  def my_reverse
    reversed = []

    self.my_each do |el|
     reversed.unshift(el)
    end

    reversed
  end

end
