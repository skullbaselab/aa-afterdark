# Abstract Data Types vs Data structures
#
# ADT:
#   logical description of a specific way to organize data, as well as the set
#   of operations for accessing/manipulating that data
#   has: behavior, properties

# Data Structure:
#   a language specific implementation of an ADT
#


# Stacks:
# => an ADT with these behaviors:
#     LAST IN, FIRST OUT (LIFO!)
#     maintains a list of things, the last thing added into it
#     is the first thing pulled out of it
#     expected methods: push (add an element), pop (remove an element)
#          length (how many in the stack), peek (look at the top element)
#

class Stack
  def initialize
    @array = []
  end

  def push(el)
    @array << el
    el
  end

  def pop   #  Stack#pop
    @array.pop  #   Array#pop
  end

  def length
    @array.length
  end

  def peek
    @array.dup.last
  end
end

# Queues:
# => An ADT with these behaviors:
# =>  FIRST IN, FIRST OUT (FIFO!)
# =>  methods: enqueue(add an element to the end),
# =>           dequeue(take an element from the front)

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def length
    @queue.length
  end 
end
