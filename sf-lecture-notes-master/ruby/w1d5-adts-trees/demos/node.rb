class Node
  attr_accessor :value, :children

  def initialize value, children
    @value = value
    @children = children
  end

end

n = Node.new "test", []

def dfs node, value
  p node.value
  return node if node.value == value
  node.children.each do |child|
    result = dfs child, value
    return result if result
  end
  nil
end

def bfs node, value
  queue = [node]
  until queue.empty?
    current_node = queue.shift
    p current_node.value
    return current_node if current_node.value == value
    queue += current_node.children
  end
  nil
end


a = Node.new "a", []
u = Node.new "u", []
r = Node.new "r", []
h = Node.new "h", []
c = Node.new "c", []
x = Node.new "x", [a]
p = Node.new "p", [h, x]
y = Node.new "y", [c, r]
f = Node.new "f", [y, u]
w = Node.new "w", [p, f]






























### IN CASE I GET STUCK ###

# def correct_dfs node, value
#   p node.value
#   if node.value == value
#     return node
#   end
#   node.children.each do |child|
#     result = dfs child, value
#     return result if result
#   end
#   nil
# end

# def correct_bfs node, value
#   queue = [node]
#   result = nil
#   until queue.empty?
#     current_node = queue.shift
#     p current_node.value
#     if current_node.value == value
#       return current_node
#     end
#     next_queue = current_node.children
#     queue += next_queue
#   end
#   nil
# end