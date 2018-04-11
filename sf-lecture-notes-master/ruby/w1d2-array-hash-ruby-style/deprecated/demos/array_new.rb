require 'byebug'

class Array

  def self.my_new(num = 0, default_element = nil, &blk)
    new_array = []
    if block_given?
      n.times { new_array << blk.call }
    else
      n.times { new_array << default_element}
    end
    new_array
  end

end
