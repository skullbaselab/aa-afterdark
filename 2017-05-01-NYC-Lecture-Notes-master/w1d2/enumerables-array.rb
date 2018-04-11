require 'byebug'

class Array
  # prc.call is more explicit than yield

  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

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
        recursive_call = el.my_flatten
  
        flattened.concat(recursive_call)
      else
        flattened << el
      end
    end

    flattened
  end

# * SPLAT operator makes a normal array of arguments
    # it must be the last listed argument

  def my_zip(*arrays)
    zipped = []

    # #times method starts at 0 and goes to num-1
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
