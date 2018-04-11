require 'byebug'

class Array
  def my_recursive_each(&blk)
    debugger
    return self if self.empty?

    blk.call(self.first)
    self.drop(1).my_recursive_each(&blk) # we choose drop to avoid mutating the original array
    self
  end
end
