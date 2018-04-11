# w1d5

+ Data Structures
  + Array
  + Tree
+ Algorithms
  + DFS
  + BFS
+ Projects
  + `TreeNode`
  + Knights Travails
  + TTT AI

---

## Data Structures
Store and organize data in computer

+ Tradeoffs of operation speed / memory
+ Can have different performance for different operations
+ Trick is knowing which is best to use for your problem
+ What's being stored
+ Ease of implementation

---

### Array

+  Linear structure
+  Ruby array is really stack + queue + array + linked list
+  logical start and end

---

### Tree

+ Good for representing heirarchical data
+ Composed of Nodes
+ Each Node has a value
+ Each Node can have zero or one parent
+ Each Node can have zero or many children
+ Trees are a *recursive data structure*
   + Each child can be the root of a **subtree**
   + Can write operations recursively
+ Trees are good for:
   + Organizing hierarchical data (e.g. file system)
   + Organizing data when fast search, insertion, and deletion are
needed
---

### Tree Vocab

+  Node/Vertex
+  Link/Edge: Connections between nodes
  + Are (N - 1) edges
+  Child, Parent, Grand
+  Root
+  Leaf
+  Depth: Depth of node is number of edges from it to root
+  Height: Height of node is number of edges in longest path from the
node to a leaf

---

### Specialized Trees

+ **Binary Tree**
  + 0 to 2 children per node
  + good for search and balanced trees

+ **Binary Search Tree**
  + "Left subtree" holds children with value less than parent's
  + "Right subtree" holds children with value greater than parent's

+ **Poly Tree**
  + 0 or many children per node

---

## Algorithms

A process for solving a problem

+ Can have many implementations in many languages
+ Searching
+ Sorting

---

### DFS

+  Stack (LIFO)
   +  Recursive call stack
+  Linear in depth (memory)
   +  Just hold one path through the tree in memory
+  Lends its self to recursive definition (check everything in left,
check everything in the right)
+  must see whole tree anyway
+  you know d, the level of the answer
+  don't care if the answer is closest to root
+  possibly explores deep dead ends

---

### DFS Process

+ Is current node's value the target?
+ Loop through nodes children
+ For each child, recursively call DFS

---

### BFS

+  Queue (FIFO)
+  Exponential in depth (memory)
   +  Has to hold whole tree in memory
+  Finds shallowest solution
+  Memory requires that we fully store the previous level and add all
children
+  Better when answer is close to the root
+  you want the answer that is closest to the root
+  have multiple cores/processors (thanks to Suresh)

---

### BFS Process

+ Add node to a queue
+ Loop through queue until its empty
  + Shift off current node
  + Check if current node's value is the target
  + Add current node's children to queue

---

# Resources

[Josh Penman's graph playground](http://graphplayground.herokuapp.com)

---

# Projects

---

## PolyTreeNode

* Many children
* Use specs provided
* Write DFS and BFS

---

## Knights Travails

+  find paths to squares on the board
+  Build a move tree at the beginning from initial position to all
possible positions
   +  Reuse your PolyTreeNode
   +  `Node` value is position
   +  Algorithm for building tree is similar to BFS
      +  Check node, then create nodes for all positions it can travel
to and
         add then to queue
      +  Keep track of visited nodes to prevent infinite loops
+  Search move tree every time you want to find path
   +  Can use DFS or BFS
   +  Then trace path back from found node to root to get the path

---

## TTT AI

+  Try to find winning move
+  Try to find non-loosing move
+  Make a `TicTacToeNode` don't use `PolyTreeNode`
   + Holds state of game at one point in time (after a given move)
   + Holds mark of next player to move
   + Optionally holds position of last move
   + Children of node are all possible game states after all possible
next moves
   + Dup the board for each child
   + Recursive methods for finding winning nodes and losing nodes out of
     children
     + NOTE: They're defined in terms of player passed in
     + Follow instructions carefully to check all conditions
+  Will create a SuperComputerPlayer that extends the old
ComputerPlayer,
   using TicTacToeNodes in its `move` to make it invincible


---

## Prep

+  https://www.youtube.com/watch?v=qH6yxkw0u78
+  https://www.cs.usfca.edu/~galles/visualization/BST.html
+  [Binary Search Tree
Diagram](http://en.wikipedia.org/wiki/Binary_search_tree#mediaviewer/File:Binary_search_tree.svg)
