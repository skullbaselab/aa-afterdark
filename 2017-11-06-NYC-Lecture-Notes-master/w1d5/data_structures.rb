# ADTs and Data Structures

# Stacks
#   LIFO (Last In First Out)

# Queues
#   FIFO (First In First Out)

# Trees/Nodes
#   - Trees have a *root* node & children
#   - Each child of a tree is itself of a tree
#   - A tree exists as long as there is a single node
#   - Each node holds a *value*
#   - In Ruby, we only need a Node class


# BFS
#   - We can use a queue to impliment this
#   - Check the value at each current node. If the node doesnt hold the
#     value, enqueue it's children (if present) and remove it from the queue
#   - If we find the value, stop the search and return the node
#   - Can be implimented recursively and iteratively
#
# DFS
#   - Relies on a stack
#   - Check each node. If the node doesn't hold a value, perform a DFS on all
#     of it's children.
#   - Our base case is to return nil if the value wasn't found, or if there
#     are no more children present
#   - If we find the value, return the NODE 
