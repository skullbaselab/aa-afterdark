[June cohort:  Daniel](./previous_lectures/june2016.txt)  
[Aug cohort:  Leen](./previous_lectures/august2016.txt)  

## Solutions prep

**Expect questions on:**
+ A01 - Practice
  + Merge sort, default proc, Why is merge a class method?
+ Should I generate the DELTAS instead of hard-coding them?

**Point out:**
+ handwritten attr_readers for `bombed?` so you can have a question mark.
+ Study strategy for A01 -- make your own assessment!

## Lecture

**1) Stacks and Queues**
+ Review definitions/methods of stack vs queue

**2) Trees and nodes**
+ Instance variables in node class (children, value, parent)
+ Why don't we need a tree class?
  + If I ever need a tree, I just need to root node!
  + Node has all the references we need to access the entire tree

**3) DFS and BFS**
+ Give sample trees. Ask for search path DFS vs BFS to specific node.
+ BFS
  + Put self in queue
  + Shift off queue until empty
    + Check node
    + Add children to queue
+ DFS
  + Check self
  + DFS each child
  + Side note: You COULD do DFS iteratively. It would look very similar to BFS using a stack instead of a queue. We're using the call stack because it's handy. Challenge students to write the iterative version after class.
+ Return values of searches: Node, not a value!
```ruby
def bfs(node, target)
  # code
end

bfs(myNode, 3) # => 3
# This would be silly!
```  
