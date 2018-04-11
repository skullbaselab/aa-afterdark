# Abstract Data Types vs Data structures
#
# ADT:
#   logical description of a specific way to organize data, as well as the set
#   of operations for accessing/manipulating that data
#
# Data Structure:
#   a language specific implementation of an ADT
#


# Stacks:
# LIFO
# -> LAST IN FIRST OUT
# -> CAN PUSH AND POP (can also peek at the top)

class Stack

  def initialize
    @stack = []
  end

  def push(arg)
    stack << arg
    self
  end

  def pop
    stack.pop
  end

  private
  # private, so hackers can't mess with your array
  attr_reader :stack
  # def stack
  #   @stack
  # end
end

# Queues:
# FIFO
# -> FIRST IN FIRST OUT
# -> CAN ENQUEUE AND DEQUEUE
#

class Queue
  def initialize
    @queue = []
  end

  def enqueue(something)
    @queue << something
  end

  def dequeue
    @queue.shift
  end
end
