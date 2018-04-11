## W1D5

---

### First off...

### A quick meditation

---

### Abstract Data Types and Data Structures

---

## Agenda

1. Today's Material
1. Quiz Solutions
1. Flex Time

---

### Assessment 01

+ I know a lot of y'all are nervous about the first assessment
+ a/A has your back
+ Make sure your machine is assessment-ready or use an a/A machine!
+ A01 Prep Seminar at lunch - go ask your questions!

---

![you-got-this-show-that-tennis-ball-whos-boss](https://media.giphy.com/media/1hpRkVM1XQgOQ/giphy.gif)

---

### Abstract Data Types (ADT)

+ Think **blueprint**
+ Defined by:
  + Possible values or state
  + Possible operations on the data
  + Behavior of those operations

e.g. Integer, Queue, Stack

Note:

A blueprint doesn't specify exactly what materials will be used to achieve the desired functionality

a language non-specific set of rules

---

### Data Structures

+ Think **the resulting building**
+ concrete implementations of an ADT

e.g. Ruby's array, tuple, class

Note:

The exact implementation of the DS could slightly alter or add functionality to the ADT
For instance, Ruby's Integer is limited to a certain (large) range

---

### `LIFO` vs `FIFO`

+ **LIFO**: 'Last In First Out' (e.g. stack of plates)
+ **FIFO**: 'First In First Out' (e.g. line of people at the DMV)

---

### Stack - LIFO

Operations

+ `add`
+ `remove`
+ `peek`

---

![epic-stack-gif-by-hope](https://media.giphy.com/media/3ohhweRgs9OZldLwas/giphy.gif)

---

### Stack Example

**ADT**: follows LIFO principle (`Array#push` and `Array#pop`)

**Data Structure**:
```ruby
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def peek 
    @stack.last
  end
end
```

---

### Queue Demo

Note:

Show difference in `implementation` here: `unshift`/`pop`/`last` vs `shift`/`push`/`first`

A good question, why do this instead of just using a Ruby array and only use those methods?
This abstracts away all other functionality of a normal array. This new object can _only_ be used like a queue, as intended.

---

### Tree (ADT)

+ Components
  + node/vertex
  + link/edge

+ Acyclic

---

![Tree](http://www.ida.liu.se/opendsa/OpenDSA/Books/TDDD86_2014/html/_images/BinExamp.png)

Note:

Let's take a look at possible implementation(DS) of one of these nodes.

---

### The Node

```ruby
class Node
  attr_accessor :value, :children

  def initialize value, children = []
    @value = value
    @children = children
  end

end
```

Note:

Do not include parent in this example, it is too confusing for students until they've implemented it. It avoids talking about the logic in `parent=`

---

### Tree (ADT)

+ Properties of a Tree
  + root
  + leaf
  + depth, height

+ Relationships of a Node
  + parent
  + child
  + sibling

---

### Tree (ADT)

+ Flavors
  + unary tree
  + binary tree
  + binary search tree
  + polytree / n-ary tree

+ How do we keep track of a tree?

+ Recursive Data Type / Structure
  + dynamically grow to an arbitrarily large size
  + contains values of the same type

Note:

Draw and label at least one type of tree

---

![Tree](http://www.ida.liu.se/opendsa/OpenDSA/Books/TDDD86_2014/html/_images/BinExamp.png)

Note:

Examples of trees in the real world:
+ OS file structure (directories/files are nodes, files are leaves)
+ git commits and branches (a tree of trees!!)
+ programming class inheritance
+ quad-trees (2D collision detection)
+ company managerial structure
+ HTML
+ Phrase structure analysis in linguistics

---

### Algorithms vs Functions / Methods

+ Analogous to the comparison between ADT's and Data Structures

---

### Algorithms

A process or set of rules to be followed in calculations or other problem-solving operations

### Functions / Methods

concrete implementations of the algorithm

Note:
Muhammad bin Musa al-Khwarizmi's book, *The Compendious Book on
Calculation by Completion and Balancing* => origin of the word
'algorithm'

Note:
I like to talk about Binary Search abstract and concrete.
You have a sorted collection, check the middle one.
If the target is less than the middle, look in the middle of the collection to the left. Greater, look to the right.

---

## Depth First Search Algorithm (DFS)

+ Stack (LIFO)
+ Follows one path through the tree at a time
+ Impatient: recursive traversal to the leaves (check one line of
  descendants at a time)

---

![DFS+BFS](https://i.giphy.com/b4V9IPlYegicM.gif)

---

## Breadth First Search Algorithm (BFS)

+ Queue (FIFO)
+ Looks through the tree by level
+ Patient: comprehensive traversal that finds shallowest solution

Note:

This can be great for finding things like shortest path.
Think of a tree that represents a map. Each node is a street corner and its children are all the street corners one block away.

---

![DFS+BFS](https://i.giphy.com/b4V9IPlYegicM.gif)

---

![Tree](http://www.ida.liu.se/opendsa/OpenDSA/Books/TDDD86_2014/html/_images/BinExamp.png)

---

### Types of Traversal

#### In-order
  + visit left-subtree, visit root, visit right-subtree
  + Use Case: traverse BST in order
#### Pre-order
  + visit root, visit left-subtree, visit right-subtree
  + Use Case: create copy of tree
#### Post-order
  + visit left-subtree, visit right-subtree, visit root
  + Use Case: delete tree

Note: 
Draw out trees and demonstrate each traversal, this slide is optional as it often causes more confusion for students

---

### Quiz Questions

[Quiz Solutions](https://github.com/appacademy/daily-quiz/blob/master/ruby/w1d5.md)  

---

### Flex Time

+ Git (Anastassia)
+ Enumerables (Ryan)
+ Recursion (Stephen)
+ Binary Search (Jesse)
+ Merge Sort (AJ)
+ Quick Sort (Andres)

---

### END

![bye](https://media.giphy.com/media/jbcjNsyVeWrK/giphy.gif)

---

### Homework Questions

+ [Questions](https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/abstract_data_types/README.md)

+ [Solutions](https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/abstract_data_types/solution.rb)

---

### Questions from Yesterday's Projects

+ [HTML-forms solution](https://github.com/appacademy/curriculum/blob/master/html-css/micro-projects/html-forms/solution.html)

+ [Screwedoku Prompt](https://github.com/appacademy/curriculum/tree/master/ruby/projects/screwdoku)

+ [Minesweeper Solution](https://github.com/appacademy/curriculum/tree/master/ruby/projects/minesweeper/solution)

