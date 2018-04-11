## First Interview

*Reminder: Grade your partner throughout the interview*

### Whiteboarding Problem

Write a function to check that a binary tree is a valid binary search tree.

Here's a sample binary tree node class:

```ruby
class BinaryTreeNode

  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
      @value = value
      @left  = nil
      @right = nil
  end

  def insert_left(value)
      @left = BinaryTreeNode.new(value)
      return @left
  end

  def insert_right(value)
      @right = BinaryTreeNode.new(value)
      return @right
  end
end
```
#### Common Gotchas

Consider this example:
```text
        (50)
      /     \
    (30)     (80)
   /   \     /   \
(20)  (60) (70)  (90)
```

Notice that when you check the blue node against its parent, it seems correct. However, it's greater than the root, so it should be in the root's right subtree. So we see that checking a node against its parent isn't sufficient to prove that it's in the correct spot.


#### Breakdown
One way to break the problem down is to come up with a way to confirm that a single node is in a valid place relative to its ancestors. Then if every node passes this test, our whole tree is a valid BST.

**What makes a given node "correct" relative to its ancestors in a BST?**  Well, it must be greater than any node it is in the right subtree of, and less than any node it is in the left subtree of.

So we could do a walk through our binary tree, **keeping track of the ancestors for each node and whether the node should be greater than or less than each of them.** If each of these greater-than or less-than relationships holds true for each node, our BST is valid.

The simplest ways to traverse the tree are depth-first and breadth-first. They have the same time cost (they each visit each node once). Depth-first traversal of a tree uses memory proportional to the depth of the tree, while breadth-first traversal uses memory proportional to the breadth of the tree (how many nodes there are on the "level" that has the most nodes).

Because the tree's breadth can as much as double each time it gets one level deeper, **depth-first traversal is likely to be more space-efficient than breadth-first traversal**, though they are strictly both O(n) additional space in the worst case. The space savings are obvious if we know our binary tree is balanced—its depth will be O(log n) and its breadth will be O(n).

But we're not just storing the nodes themselves in memory, we're also storing the value from each ancestor and whether it should be less than or greater than the given node. Each node has O(n) ancestors O(log n) for a balanced binary tree), so that gives us O(n^2) additional memory cost O(nlogn) for a balanced binary tree). We can do better.

Let's look at the inequalities we'd need to store for a given node:
```text
           (50)
         /     \
      (30)     (80)
      /   \     /   \
   (20)  (60) (70)  (90)
   /          /      /  \
(10)        (60)    (85)(100)
```
Notice that we would end up testing that the blue node is <20, <30,and <50. Of course, <30 and <50 are implied by <20. So instead of storing each ancestor, we can just keep track of a lower_bound and upper_bound that our node's value must fit inside.

#### Solution
We do a depth-first walk through the tree, testing each node for validity as we go. A given node is valid if it's greater than all the ancestral nodes it's in the right sub-tree of and less than all the ancestral nodes it's in the left-subtree of. Instead of keeping track of each ancestor to check these inequalities, we just check the largest number it must be greater than (its lower_bound) and the smallest number it must be less than (its upper_bound).

```ruby
def is_binary_search_tree(root)

  # start at the root, with an arbitrarily low lower bound
  # and an arbitrarily high upper bound
  node_and_bounds_stack = []
  node_and_bounds_stack.push([root, -Float::INFINITY, Float::INFINITY])

  # depth-first traversal
  while !node_and_bounds_stack.empty?
      node, lower_bound, upper_bound = node_and_bounds_stack.pop()

      # if this node is invalid, we return false right away
      if (node.value <= lower_bound) || (node.value >= upper_bound)
          return false
      end

      if node.left
          # this node must be less than the current node
          node_and_bounds_stack.push([node.left, lower_bound, node.value])
      end
      if node.right
          # this node must be greater than the current node
          node_and_bounds_stack.push([node.right, node.value, upper_bound])
      end
  end

  # if none of the nodes were invalid, return true
  # (at this point we have checked all nodes)
  return true
end
```
Instead of allocating a stack ourselves, we could write a recursive function that uses the call stack. This would work, but it would be vulnerable to stack overflow. However, the code does end up quite a bit cleaner:

```ruby
def is_binary_search_tree(root, lower_bound=-Float::INFINITY, upper_bound=Float::INFINITY)
  if not root
      return true
  end

  if (root.value >= upper_bound || root.value <= lower_bound)
      return false
  end

  return is_binary_search_tree(root.left, lower_bound, root.value) \
      && is_binary_search_tree(root.right, root.value, upper_bound)
end
```

#### Complexity
O(n) time and O(n) space.

The time cost is easy: for valid binary search trees, we'll have to check all n nodes.

Space is a little more complicated. Because we're doing a depth first search, node_and_bounds_stack will hold at most `d` nodes where `d` is the depth of the tree (the number of levels in the tree from the root node down to the lowest node). So we could say our space cost is O(d).

But we can also relate `d` to `n`. In a balanced tree, `d` is log(base2)n. And the more unbalanced the tree gets, the closer `d` gets to `n`.

In the worst case, the tree is a straight line of right children from the root where every node in that line also has a left child. The traversal will walk down the line of right children, adding a new left child to the stack at each step. When the traversal hits the rightmost node, the stack will hold half of the `n` total nodes in the tre. Half n is O(n), so our worst case space cost is O(n).

#### Bonus
What if the input tree has duplicate values?

#### What We Learned
We could think of this as a greedy approach. We start off by trying to solve the problem in just one walk through the tree. So we ask ourselves what values we need to track in order to do that. Which leads us to our stack that tracks upper and lower bounds.

We could also think of this as a sort of "divide and conquer" approach. The idea in general behind divide and conquer is to break the problem down into two or more subproblems, solve them, and then use that solution to solve the original problem.

In this case, we're dividing the problem into subproblems by saying, "This tree is a valid binary search tree if the left subtree is valid and the right subtree is valid." This is more apparent in the recursive formulation of the answer above.

Of course, it's just fine that our approach could be thought of as greedy or could be thought of as divide and conquer. It can be both. The point here isn't to create strict categorizations so we can debate whether or not something "counts" as divide and conquer.

Instead, the point is to recognize the underlying patterns behind algorithms, so we can get better at thinking through problems.

Sometimes we'll have to kinda smoosh together two or more different patterns to get our answer.


### Behavioral
1. Describe a situation in which you met a major obstacle in order to complete a project. How did you deal with it? What steps did you take?
2. Give an example of a time when you didn’t agree with another programmer. How did you handle this?

### Personal Pitch
Tell me about yourself.
