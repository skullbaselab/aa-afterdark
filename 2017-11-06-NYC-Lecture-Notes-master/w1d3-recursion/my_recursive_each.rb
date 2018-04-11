class Array
  def my_recursive_each(&blk)
    return self if self.empty?

    blk.call(self.first)
    self.drop(1).my_recursive_each(&blk)
    self
    # self is always the current array being called
  end
end
