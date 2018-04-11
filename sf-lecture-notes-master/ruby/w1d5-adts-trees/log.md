# W1D5

## 02/16/2018

Lecturer: David
Scribe: Aaron

### Questions

+ Do we need to call the instance variable stack?
  + We are not using the instance variable, we are using the
    _attr_reader_ method we defined
+ Why do we use the `attr_reader` instead of the instance variable then?
  + It allows typos to not fail silently (made a empty method that said
    `@stick = []`
+ Why do we want to hide the rest of the information in the stack?
  + It doesn't matter for things like trays or plates, but it could be
    holding sensitive information (like a game of blackjack)
+ Can we make the `@stack` instance variable private?
  + No, but there is a solution we will get to.
+ Can we put the reader under private?
  + Exactly
+ Can you explain the private `attr_reader` again?
  + We made the stack reader private, so we aren't allowed to call the
    `stack` method on 
+ What happens if we have a local variable named `stack`?
  + Since we are using `stack =` and we don't have an `attr_writer`,
    it will define a local variable. Did a quick demo.
+ So we should leave `self` off?
  + So that is a style choice. My advice would be to use `self` until
    you can't for clarity, especially as a new ruby developer.
+ So when we `dup` the queue, is that a shallow copy?
  + Yes, but in this implementation, we are only planning on storing
    immutable objects.
+ Like we did for a queue, could we have a tree class that hides the
  information of our nodes?
  + The purpose of building the trees we will have today is to traverse
    them so we won't want to hide that functionality.
+ Will we want to include a `parent`?
  + Generally, we would. But let's say for this example, we only ever
    want to go down the tree, not up.
+ So in DFS, we return the node with the value and don't visit its
  children?
  + Yes, when we find the node we want, we should exit out of the search
+ Does that mean each node has to have a unique value?
  + For each tree there are different implementations. Usually, you want
    some kind of unique identifier, but that depends on the data set.
+ Do we ever want to know the depth of the node?
  + Yes, that could be relevant depending on the problem. You might also
    want to keep track of the nodes you visited to get there. For
    instance, Google Maps could use street corners as nodes.
+ So this would be a stack of nodes, not values?
  + So for BFS, we used an actual queue to track nodes. In DFS though,
    we use the call stack when we make recursive calls to
    `dfs(node, val)`.
+ How would we search the leaves first?
  + We could do what Haseeb did in the lecture. That would just reverse
    the order of operations in our DFS. Instead of checking the value
    and then calling `dfs` on the children, we would call `dfs` on the
    children before checking the value of our current node.
+ They say BFS is good if its close to the root. How can we know that?
  + Typically, you will know something about your tree or where the
    node is. If you don't, you can try both options and see which is
    faster. You can also run into issues with tree size. If the tree is
    very wide but not deep, we will add a bunch of nodes to the queue
    as we go across a level. This may be more memory than we want to
    take up. We can also do a combination of DFS and BFS. For instance,
    we might know that from the top level, our node is probably in our
    left branch. We could use DFS for X levels to get us to the most
    probable section of the tree and then use BFS to search that
    portion. Lots of options.


## 12/08/2017

Lecturer: Aaron!!!
Scribe: Ryan II

## Lecture Questions 

* for the stack ADT, can you do the opposite (shift and unshift instead of pop and push)
  * yes, you can also do this; it will have the same functionality 
* would this reverse approach be like removing plates from the bottom? 
  * yes, it would 
* is it true that you can only look at the ends of the data structure, for a stack and a queue? 
  * yes, for a queue and a stack, we shouldn't know what's going on inside of the ADT, we should only really have information  about we add to or remove from the ADT
* for a queue, can you see both sides of the ADT? 
  * yes, you could add that functionality 
* does Ruby have built-in ADT? 
  * Ruby and all languages have specific implementations of ADTs, data structures 
* does Ruby have a way to stop people from looking at an Array? 
  * There are ways to look into these objects if you really want to, via metaprogramming
  * Right now, we would need to have a reader or accessor to make them available 
* Do you need accessors to make any given program work? 
  * Depending on how you want other objects to interact with the object that you are design, that's the appropriate moment you consider the appropriate accessors 
  * Accessors will allow your objects to interact with one another by building read/write methods 
* ??? Unknown questions 
  * Let's pretend that the value passed for the parent is not nil 
  * This could be written better 
  * RE: definition of class Node as presented example
* So, how does this relate to the tree? Are we creating the tree with this class Node?
  * Yes, this Node instance is going to be the B node 
  * Let's say that we also created nodes of other numbers: in summation they form a tree structure with parent and child interrelations 
* Is the reason that the ??? is changed is because of the attr_reader?
  * Yes 
* Should't the shoveling process happen when you initialize? 
  * We can't do this for the first node, but we can do it for the node that is coupled to the first nod 
* Could you put b = Node.new as an argument? 
  * I don't know; that is something that you can try on your own 
* When you initialize B, you should set up the link when you... (incomprehensible) 
  * Definitely; that is something that you will build
  * This is something that you will build today 
* ?? Could not hear the question 
  * Yes, that is definitely something that we want to do 
* Can you briefly explain the difference between reader and writter attr_accessors 
  * Reader will define a read method; writers will define the writer method
* Why not use accessor all the time? 
  * Sometimes you don't want to give other people that kind of access to your variables 
* If parent is nil, should you assume it's the root? 
  * Yes 
* Could you define a method called get_root? 
  * Yes, we'll cover something similar to that in a second 
* In regard to the siblings, only B and D, etc. are siblings? 
  * No, but it depends on your implmentation of the tree 
* Will there be no siblings in a unary tree? 
  * Yes, that is a good way to describe it 
* You're describing a balanced binary tree, right? 
  * Yes, that is what I am describing 
* Does it check 2 before it checks 3? 
  * We will talk a little bit about that 
* For the DFS, nodes 5 an 7, is the order of checking arbitrary? 
  * It is somewhat arbitrary 
  * It will depend on the order of the children array 
* Once it goes to the bottom, how does it know how to go back up? 
  * That DFS function, after checking its target value against its own value, will return to the previous node, which is trying to check out all of its children 
  * For each recursive call, you would iterate over the children array making a recursive call at each node 
* How can we determine that it has three? 
  * We can follow the return values (?) (Sorry, scribe was distracted with temporary lastminute circle planning) 
* In order, will it first check 1? 
  * Yes


## Notes for Aaron 




## 08/04/2017

Lecturer: Hope!!
Scribe: Young Hesse

### Lecture Questions

* would a hash be both a set and a map
  * set ADT can be implemented in ruby using a hash, but can also implement a map ADT with a hash as well
* what does "ADT" signify
  * a language non-specific set of rules and implementation that explains the behavior of a kind of data type
* certain data structures in ruby are ADT, but there are others that you have to implement yourself?
  * yes, eg. (arrays, basic hashes)
* does ruby have versions/libraries of these that you can call upon using "require" like with gems?
  * have to check on that later
* why do we (.dup)?
  * so that we don't accidentally alter the data
* what mistake would happen if we didn't dup / what could go wrong?
  * would alter the actual value of the data type
* why couldn't you just use p to show instead?
  * that print statement is different than actually returning a data type, also p statements aren't visible anywhere outside of the console
* why did the function return the value that we just added to the stack
  * returning the element, could be useful, in case you needed to see/ utilize an element you just added
* why are you implicitly returning the element in enqueue
  * it depends on what you want to do with the information/if you need access to that value afterward
* doesn't push method implicitly return the element that it is pushing
  * it returns the new data type value, not the element that you pushed in
* potentially why we call a return on the element that we just pushed in is also so that folks cant affect the data that we just altered
  * yes
* why dup on some ADT vs deep_dup
  * such that we can create deep-copies of the data as opposed to shallow copies so that when we alter one it wont have any affect/accidentally mutate the original array
* what is the difference between height and depth? (will slack out)
  * depth is distance from root, height is distance from deepest ...(node?)
* for binary tree, it can be at most 2, but can also have just 1 or 0
  * yes   
* is an array considered a unary tree?
  * no
* distinction between binary tree and binary search tree?
  * binary search tree would be ordered, while binary tree could just be any collection of nodes in any order
* how expensive are function calls in ruby?
  * in general recursion is worse due to space complexity, recursion could be very fast depending on what you use it for
* what do you mean about space complexity?
  * more will be explained in a future lecture if you wait til next Thursday
* what do you mean by has one path (DFS)
  * in memory. it refers to the route it takes and then if it doesn't find it it starts back at the top
* if it was a recursive call then we would check the deepest node first?
  * if that was the case then yes technically, but it gets implemented from the top down in practice usually
* what is going on in the node class? what's going on when you create the tree
  * we can create it from both directions, but we are assigning a parent and children when we call Node.new(...)
* When DFS vs BFS
  * if you have a sense of where the data might be in the tree, that might help inform that decision
* did I miss something on line 15 with "return result if result"
  * checking if nil because nil is a falsey value
* do you have to put the null at the end?
  * if you didn't, we would implicitly returning "node.children"
* do you know if there was maybe a ruby gem to graph what we've made?
  * i don't know of any, but some could feasibly exist, the googles are your friend(?)
* we're starting with a  queue thats just the root and the goal is to get an empty queue?
  * the goal is to find the node we're looking for, and the queue will fill and empty as we go
* is our bfs search destructive?
  * we arent shifting off of the children array, the node instance/objects are being added themselves to the array, but we aren't influencing the children
* how you would define the children with the children method? eg example being tic tac toe
  * after you pick one spot to put an "X" then every other potential move would then be the children in your tree
* what would root actually look like?
  * a node with no parent
* children method?
  * the instance variable on the node class
* for the bfs search, is that assuming the root and the target are not equal
  * the first thing you would check would be the current node and then you would immediately find it, so no issue there
* can we walk through the dfs in the quiz solutions
  * yes (naturally a walk through commenced)




### Notes for Hope

* during code demos, keeping code at the top of the screen so folks in the back can see (cmd + k)
* don't forget to repeat questions
* move a little bit slower through slides, or break up the slides a little bit




## 08/04/2017

Lecturer: Hope!!
Scribe: Dallas

### Lecture Questions

* Is it common when implementing an abstract data type to use push over shovel?
  * It works either way.
* Why do we return an array?
  * To see what is inside.
* Why do we use an array? Why not a hash?
  * We would have to keep track of order, which wouldn't be convenient.
* Why do we need dup?
  * We stop bad people from modifying the data in ways we didn't intend. Assume some users are evil. Haha!
* Could you use a splat arg with a queue?
  * Yes, but you have to additional work to accept multiple args.
* Is it more common when enqueuing to return the element or the array?
  * We can set it up either way. It depends on our needs.
* Could you check the children before enqueuing?
  * For sure, just not in this demo.
* How do stacks and queues fit into the trees and nodes?
  * You can use stacks or queues in your traversal methods (stacks: recursive, queues: iterative)
* Shouldn't we pop off 'A' from the tree before going back down the tree?
  * Depends on how we write our implementation. In our case, no.
* Do you always search from the left child to the right?
  * Typically, especially when we draw it like this.
* Is one faster than the other (BFS vs DFS) if you have to go to the end of a tree?
  * Not really. The recursive call might be less efficient because it is recursive, but it is the same number of checks.
* Is there a reason that `bfs` and `dfs` look like they are outside the `Node` class?
  * Because they are.
* If we are dealing with a binary tree, do we have to iterate of the children?
  * You could just hard-code the calls, but why?
* Why do we need the `Node` class? Can we do `bfs` or `dfs` without it?
  * We need the `Node` class to build the tree.
* This isn't a tree class though, right?
  * Correct. It is a tree, but we didn't make a `Tree` class. It's just for our `bfs`/`dfs` demo. :)
* Where does the tree live?
  * The relationship between the nodes constitute a tree.

### Notes for Hope

* Speak up a bit.
* Ninja code demo!!

## 06/02/2017

Lecturer: Dallas Hall
Scribe: Kelly Chung

### Lecture Questions

+ How do I distinguish between an ADT and Data Structure?
    + If you've implemented in code, it's a data structure.
+ Can we think of integers and strings as primitive data types
    + Yes you can think of them as primitive data types, but it depends
  on the language you're coding in
+ Is this kind of how recursion works?
    + You can implement a problem recursively using a stack or a queue.
+ Ruby doesn't `dup` returned methods for you?
    + No, it does not.
+ Can you do an example without a `dup`?
    + *Demos what happens without dup*
+ In the `def` line of a function, you don't need to use parantheses?
    + Nope
+ Explain line 14 (of dfs code demo)
    + *Explains*
+ Syntactically is it better to call it `debugger` or `byebug`?
    + Doesn't matter, but `debugger` is more universal.
+ Without `attr_reader`, could we access the instance variable?
    + No, not without being hacky.
+ For better code style, is it better to explicitly write your
parentheses out?
    + I personally prefer them everywhere, but the convention is to include
  them in function definition and to leave them out in calling a function
  (at least in Rails)
+ Is it required to use recursion when you have recursive data structure?
    + No, but when you have a recursive data structure, that's a great
  signal that it will require recursion.
+ If we have a giant tree, do we run the risk of stack overflow?
    + Potentially, if the depth is over 9000
+ Is that the same if the breadth is wide enough?
    + Nope

### Screwdoku Questions

+ What is a factory method?
    + Methods that defines an instance of the class with the provided
  instance variables
+ Aren't we technically defining the board in the factory method?
    + Yes, but we're also defining an array with a list of tiles
+ Can you walk us through the neighbors method in minesweeper?
    + *demonstrates*
+ How does this have access to the board?
    + *demonstrates*

### Notes

+ do half the demos(demo stack + bfs AND walkthrough prewritten queue +
  dfs or vice versa)
+ try to push very specific questions about the projects to the end or
office hours

# W1d5

### 03/31/2017

Lecturer: Kelly Chung

## Assessment Questions
- how do I study for the assessment? do I do the practice assessment
over and over?

## Content Questions: ADT / Stacks / Queues
- When we're coding in Ruby, are we implementing data structures or
ADT's?
  - And arrays and hashes are already implemented in Ruby?
- Is it better practice to mutate or return copies of arrays?
- How does attr_reader work?
  - Does it stop you from modifying what is inside a class?
- What does attr_accessor do? How does it work?
- What's the difference between duping and deep duping?
- If the elements inside Stack aren't primitive data types, wouldn't we
need to deep dup?
- Do instance variables correspond to the instance of the class?
- Since we're monkeypatching a class, can we replace an instance
variable with self in an instance method? (for class Queue and instance
  variable @queue)

## Trees
- Can a root be a node? (Trees)
- In memory, does a tree look like a tree? How is it stored?
- What is an edge?
- How would you find the root of the tree?
- Are height and depth the same for a tree?
- What is depth for a node?  
- Are git commits nodes that are linked together somehow?
- ( Students seem to be uncomfortable with what a node is/ can be )
- Arrays have indices, linked lists do not
- Why is 2 < 4 ( in the binary search tree )?
- Is a block a function or a method?
- What does BST stand for?
- Are a node's children represented as objects in an array?
  - How might you access the children? Do you iterate?
- How does pre-order traversal work?
- In what order are children visited in breadth first search?
Iteratively?
- Children vs grandchildren ?
- Can you draw us through depth first search on the whiteboard?
- Is this kind of like merge sort and binary search?
- Could you implement DFS to visit nodes in a different order?
- Do the traversals apply to any tree?
- Are postorder and in order both depth first traversal?
- Can we go over preorder, inorder, and postorder again?
- Is there a name for the BFS traversal order?
- What is BFS vs DFS?

## Homework Questions
- I was confused by a git command in the homework
- How do we push pair programming projects to our own githubs?
- How does Ruby's implementation of hash work?

## Projects
- Is there a format for pushing to github we should use every time?

## Quiz
- Question 3: please explain
- Question 4: please explain
  - couldn't the order include the other answers?

## Notes
- ask if atom text is large enough
- remember to keep whatever you're typing in atom at the top of the
screen
- lights out}
- take a break a little < 1 hr into the lecture


# W1D2

## 11/18/2016

Lecturer: Munyo Frey


## General Observations
* Maybe repeat the questions that are asked so all the students can hear
(and so I can hear).
* Zoom in a tad more for people in the back.
* Are the students ever informed about pre-order, in-order, and
post-order traversal? Should we maybe just mention in passing that we
are choosing to use pre-order for our DFS?

## General Questions
* How long is the first assessment?

## Quiz Questions
Successfully avoided out of scope/philosophical questions about trees!
* In regards to DFS, do we need to make the tree into an array before
performing the search?
  * No.

## Homework Questions
* Some question about variable assignment as reference.
  * Mutating a variable elsewhere will change it for all variables
referencing that object.
* Why does the add method for the stack return the element that was
added?
  * That's what happens with, for instance, the push method.
* Several questions: What's the point of abstract data types?

## Questions about Yesterday's Work
* Why use Set instead of Array?
  * It's _muy rapido_.
  * Stay tuned for more on this next week.

## DFS Questions
* How do we know the height of the tree if we only know a part of it?
  * You have to know the whole tree. You can't see if sibling nodes have
the same number of children without having all the applicable
information.
* Which data structure should we use to creates nodes of trees? A hash?
  * We will build our own Node class.
* Shouldn't there be a Node class already available to us?
  * You probably will always want to build your own since the data
attributes that you'll need on the node are probably going to change
every time.
* Will nodes have a relationship to the siblings?
  * No, a tree is a directed graph, and there is no connection between
siblings, only that they both have the same parent.
* Should we return the child if the child exists?
  * Yes.
* Why have a default target of nil?
  * Then it allows us to just perform a traversal.
* What's the order of checking? Do we check the parent before the
children?
  * Yes.
* Won't our DFS just return nil and not make it to the children?
  * No, when we make our recursive call, we don't move further along in
the code until we return a value and pass it back up.
  * The returned value bubbles up.

## BFS Questions
* What if our tree were circular?
  * Then that'd be a directed, circular graph.
* Question about the order of the search...
  * Haseeb's video does the child first?
* Why set the queue to initially be self?
  * We'd like to check the parent before the children.



## 9/16/2016

Lecturer: Gage Newman

### Questions (incorporated into the lecture note outline)

# w1d5

## Agenda
* Common Mistakes (5 min)
* Questions from yesterday's assignment (5 min)
* Practice Assessment questions (10 min)
* Quiz Solutions (5 min)
* Questions from the homework (5 min)
* Today's Material (30 min)

---
## Common Mistakes

  * Tile\#explore
https://github.com/appacademy/curriculum/blob/master/ruby/projects/minesweeper/solution/00_minesweeper.rb
    - looked at code and then asked questions.
    - questions in coupling for board class/ tile class. Is it bad for
the tile to have a reference to its parent class?
  * Syntactic sugar methods
---

## Questions from Yesterday's assignment
* screwedoku:
https://github.com/appacademy/curriculum/tree/master/ruby/projects/screwdoku
  - git diff as a method for debugging - is this recommended? Where are
the red and green lines
  - begin-rescue statement in the final level of screwedoku - what was
wrong with it? Should we be rescuing all exceptions?
  - how do you get the error for a begin-rescue block? (rescue
TypeError=> e)
  - Questions on raising TypeErrors
  - How should we be saving all of our materials to github? Namely what
is the file structure we need.
* minesweeper solutions:
https://github.com/appacademy/curriculum/blob/master/ruby/projects/minesweeper/solution/00_minesweeper.rb

---

## Questions about the Practice Assessment
(assessment prep seminar at lunch)
  * Theoretical failing score?
  * Would the failing score ever be as high as the median?
  * Can we expect difficulty to be on pair with the practice assessment?
  * Did you do the practice assessments over and over again until they
were easy?


---

# Quiz Solutions
* quiz with answers:
https://github.com/appacademy/daily-quiz/blob/master/ruby/w1d5.md

---

# Questions from Homework
* questions:
https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/questions/abstract_data_types.md
* solutions:
https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/solution/abstract_data_types.rb

---

## Data Structures
  * Student ideas:
    - interface
    - implementation of the tool
    - one way to implement
    - Objects

## Abstract Data Types
  * Student ideas:
    - idea  
    - multiple different ways to implement
    - algorithms
---

### All About Trees

+ Composed of Nodes that hold information
+ Trees are a *recursive data structure*
  - Can any node be treated like a root? (i.e. can we cut the parents
off if we don't care about the rest of the tree)
+ Vocab: Node, Link, Child, Parent, Root, Leaf, Depth, Height


---

## Algorithms
vs
## Functions

---

### BFS
(algorithm)

+  Queue (FIFO)
+  Has to hold whole tree in memory
+  Finds shallowest solution

#### Questions
+ Have we done a lot of building trees without knowing it? A lot of
references to previous projects.
+ Don't these have to be recursive? talked about the difference between
DFS and BFS
+ Wouldn't this still give you a list of possible solutions and you
still have to iterate through the whole queue?
+ Are BFS/DFS why ruby's search function only give you the first option.

---

### BFS Process

+ Add node to a queue
+ Loop through queue until its empty
  + Shift off current node
  + Check if current node's value is the target
  + Add current node's children to queue

---

### DFS
(algorithm)

+  Stack (LIFO)
+  Just hold one path through the tree in memory
+  Lends itself to recursive definition (check everything in left, check
everything in the right)


#### Questions
+ When is to better to do DFS or BFS.
+ looked over DFS method, walked through each step.
+ traversal or a search (make better change vs DFS)
+ Why does the tree exist? How does it exist?

---

### DFS Process

+ Is current node's value the target?
+ Loop through node's children
+ For each child, recursively call DFS

---

## note that in both of these algorithms, we need a reference to the root

---

### Types of Trees

+ Binary Tree
  + Binary Search Tree
    + *Left subtree* & *Right subtree*

+ Poly Tree (unlimited # of children)


### Questions
+ BFS what if we added children to nodes or subtracted them
+ BFS questions about the array - queue from binary tree
+ Hash versus array options for storing trees - can you describe a whole
tree this way?



---

# wasn't that great
is there time for closing questions?

---


## 6/15/2016

Lecturer: Gage Newman

### Questions

  #### YESTERDAY
+ syntactic sugar on board in minesweeper

  #### ASSESSMENT
+ how much to study / how to know what to know for the assessment

  #### HW
+ array duping / mutation
+ assigning in Map class — no duplicate keys

  #### TODAY
+ implementation details
