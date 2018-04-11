# Trees:
#   - composed of nodes
#   - each node has (up to) one parent node and (potentially many) children
#   - each node has a value
#
#           1  -> root
#         /   \
#        2     3
#       / \   / \
#      4   5 6   7  -> leaves. Nodes without children.
#
#
#   Q: Do we need a tree class to implement this ADT?
#   A: No. All we need is a Node class!
#

class Node
  attr_accessor :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def inspect
    "#{self.value}: #{self.children.map(&:value).join(", ")}"
  end



end

# Breadth-First Search (BFS)
#   ADT needed: Queue
#   Searches: Row by Row
#
#   Let's implement!
#   -> Initialize a queue, putting that node in a queue
#     -> Queue = array with self in it
#   -> Iterate over the queue until it's empty
#     -> Shift off first el of queue
#     -> Check its value
#       -> if it's equal, return it and break
#       -> else, add children to queue for later checking
#       -> if queue is empty/we run out, return nil, cause it's not in there


# Depth-First Seach (DFS)
#   ADT needed: Stack
#   Searches: Allll the way down
#
#   Let's implement!
#   -> Base case!
#     -> if value = target value, return that instance of node
#   -> Iterate over our children
#     -> Call DFS on each child
#     -> Check return value of that DFS
#       -> if return value = nil, didn't find anything in that search, so keep on iterating
#   -> If no return from whole iteration, return nil.
