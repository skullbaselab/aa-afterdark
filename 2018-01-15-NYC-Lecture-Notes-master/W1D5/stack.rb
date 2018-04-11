#ADT: Abstract Data Type
# - A logical description of how to store data
# - Plus, all of the ways we can manipulate that Data (API)
# ***ABSTRACT***
#
# DATA STRUCTURE:
# - ADT implemented in specific coding language

#Stack: first in last out (last in first out)
#API: Push(item), pop(), show()
class Stack

  attr_reader :underlying_array

  def initialize
    @underlying_array = []
  end

  def push(el)
    self.underlying_array.push(el)
  end

  def pop
    self.underlying_array.pop
  end

  def show
    underlying_array.last
  end

end


#Queue: First in, first out (FIFO)
# - API: enqueue(item), dequeue(), peek()
class Queue

  attr_reader :underlying_array

  def initialize
    @underlying_array = []
  end

  def enqueue(item)
    underlying_array.push(item)
  end

  def dequeue
    underlying_array.shift
  end

  def peek
    underlying_array.first
  end
  
end



























#end_of_doc
