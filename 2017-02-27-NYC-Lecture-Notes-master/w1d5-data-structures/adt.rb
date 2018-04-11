# Abstract Data Types!

# STACK
# can push/pop or shift/unshift
# LIFO: Last In, First Out

class Stack
  attr_reader :elements
  def initialize
    @elements = []
  end

  def empty?
  end

  def push(el)
    self.elements.push(el) # specific implementation doesn't matter as long as you're consistent
    # self.elements.unshift(el)
  end

  def pop
    self.elements.pop
    # self.elements.shift
  end

  def size
  end
end

# QUEUE
# push/shift or unshift/pop
# FIFO: First In, First Out (a very fair data type)

class Queue
  def initialize
    @elements = []
  end

  def empty?
  end

  def enqueue(el)
    self.elements.push(el)
  end

  def dequeue
    self.elements.shift
  end

  def size
  end

  private # allows us to keep users from accessing the inner elements

  attr_reader :elements
end

# Some Highlights:
# You don't need a Tree class, only a Node class
# Nodes will know their parent and children
# The root node will not have a parent
# Nodes also need to know their own value, of course
# We can search trees in depth-first or breadth-first styles
# Make use of a stack (using the callstack via recursion!) for DFS, and a queue for BFS
# When we search a tree for a value, we want to return the node that contains that value
