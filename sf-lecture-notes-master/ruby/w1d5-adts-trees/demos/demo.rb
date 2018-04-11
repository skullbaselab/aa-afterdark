require 'byebug'

class Node
  attr_reader :value, :children
  def initialize(value, children = [])
    @value = value
    @children = children
  end
end

def dfs(node, target)
  puts node.value # Just for fun
  return node if node.value == target
  node.children.each do |child|
    result = dfs child, target
    return result if result
  end
  nil
end

def bfs root, target
  queue = [root]
  until queue.empty?
    current_node = queue.shift
    puts current_node.value
    return current_node if current_node.value == target
    current_node.children.each do |child|
      queue.push(child)
    end
    # queue.concat current_node.children
  end
  nil
end



d = Node.new("d")
g = Node.new("g")
h = Node.new("h")
i = Node.new("i")
b = Node.new("b", [d])
e = Node.new("e", [g])
f = Node.new("f", [h, i])
c = Node.new("c", [e, f])
a = Node.new("a", [b,c])

