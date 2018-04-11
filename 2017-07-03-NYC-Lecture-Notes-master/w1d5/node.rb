# Trees:
#   - composed of nodes
#   - each node has (up to) one parent node and (potentially many) children
#   - each node has a value
#   - poly tree - each node can have any number of children
#   - binary tree - each node can have at most two children
#
#           1
#         /   \
#        2     3
#       / \   / \
#      4   5 6   7
#
#   DFS - Order of search (if it didn't find anything)
# =>        1, 2, 4, 5, 3, 6, 7
#
#  BFS - Order of search (if it didn't find anything)
#           1, 2, 3, 4, 5, 6, 7

class Node
  attr_accessor :parent, :children

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end

end

root = Node.new(5)
root.children << Node.new(1, root)
root.children << Node.new(2, root)


#
#   Q: Do we need a tree class to implement this ADT?
#   A: NO
#


# Breadth-First Search (BFS)
#   ADT needed: Queue
# => 1) check if the front node in the queue is the target
# => 2) if not, remove it from the queue and enqueue its children
# => 3) keep going until you find the target or the queue is empty!
#
#  bfs(node, target)
#  initialize queue = [node]
#  loop until queue is empty
#     dequeue a node, check if its the target
#     break out of loop when we find the target
#     if its not the target, enqueue all its children
#  loop ends when queue is empty
#  return nil 

# Depth-First Seach (DFS)
#   ADT needed: Stack
# => 1) check if this node is the node
# => 1) check all my children, run the same seach on each of them


# recursive_DFS(node, target)
# is node the target? if yes, return this node
# if not, iterate over all children:
#   with each child, we invoke recursive_DFS(child, target)
#   if the result of that call was nil, go to the next child
#   and so on until we get through all the children
# if we got through all the children and didn't find anything then
#  return nil

# stack_DFS(root, target)
# => stack = [node]
#    until stack.empty?
#    el = stack.pop
#   if el.value == target
#     return el
#   else
#     add each child to the stack
