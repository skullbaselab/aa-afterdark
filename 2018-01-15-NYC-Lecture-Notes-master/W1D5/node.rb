# TREE:
# - A bunch of nodes connected to one another
# - Each node could have children, and could have a parent

# A node has a value, it might have children, and it might have a parent.
# A node without a parent is the root
# A node without children is a leaf
# Roots of subtrees have parents
# If you have the root node you can look at the entire tree
class Node

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end

  # DFS: depth-first-search
  # 1.) Are you the Node we're looking for?
  # 2.) Do you have any children?
  # 3.) Run DFS on all the children
  dfs(node, target)
  return node if node value is target
    for each child
      store result of dfs(child, target)
      return result if it is a node
    end
    return nil
  end

  # BFS: breadth-first-search
  # 1.) Are you the node we're looking for?
  # 2.) Queue up the children
  # 3.) Go back to one
  bfs(node, target)
    queue = [node]
    until the queue is empty
      curr_node = queue.shift
      investigate curr_node
      add children to queue
    end

    return nil
  end











end
