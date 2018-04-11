# STACK - LIFO

class Stack
  def initialize(argument)
    @elements = []
  end

  def push(val)
    @elements.push(val)
  end

  def pop
    @elements.pop
  end

  def size
    @elements.size
  end

end

# QUEUE - FIFO

class Queue
  def initialize(argument)
    @elements = []
  end

  def enqueue(val)
    @elements.unshift(val)
  end

  def dequeue
    @elements.pop
  end

  def size
    @elements.size
  end

end

# TREE

class Node
  attr_accessor :parent, :children

  def initialize(parent = nil)
    @parent = parent
    @children = []
  end

end

# [2] pry(main)> root = Node.new
# => #<Node:0x007fdf7887cf80 @children=[], @parent=nil>
# [3] pry(main)> child1 = Node.new(root)
# => #<Node:0x007fdf78aa47b8
# @children=[],
# @parent=#<Node:0x007fdf7887cf80 @children=[], @parent=nil>>
# [4] pry(main)> root.children << child1
# => [#<Node:0x007fdf78aa47b8
#  @children=[],
#  @parent=#<Node:0x007fdf7887cf80 @children=[...], @parent=nil>>]
# [5] pry(main)> root.children
# => [#<Node:0x007fdf78aa47b8
#  @children=[],
#  @parent=#<Node:0x007fdf7887cf80 @children=[...], @parent=nil>>]
# [6] pry(main)> child2 = Node.new(child1)
# => #<Node:0x007fdf788974c0
# @children=[],
# @parent=
#  #<Node:0x007fdf78aa47b8
#   @children=[],
#   @parent=
#    #<Node:0x007fdf7887cf80
#     @children=[#<Node:0x007fdf78aa47b8 ...>],
#     @parent=nil>>>
