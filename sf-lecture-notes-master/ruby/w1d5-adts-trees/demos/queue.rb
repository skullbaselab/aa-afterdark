class Queue
  def initialize
    @inner_array = []
  end

  def enqueue(el)
    # @inner_array.push(el)
    @inner_array.unshift(el)
  end

  def dequeue
    @inner_array.pop
    # @inner_array.shift
  end

  def peek
    # @inner_array.first
    @inner_array.last
  end
end
