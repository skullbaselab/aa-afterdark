class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_map(&prc)
    mapped_array = []
    self.my_each { |el| mapped_array << prc.call(el) }
    mapped_array
  end
end
