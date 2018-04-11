# Week 1 Day 4


### Data Structures

+ **stack**: push and pop
+ **queue**: push and shift

#### Tree vocab

+ node (or an vertex)
+ link (or an edge)
+ root: node at the very top of the tree
+ children
+ depth: number of edges from root to a leaf
+ height: number of edges from current node down to farthest leaf in that branch

#### Binary Trees

+ **binary tree**: every node has 2 children
+ **binary search tree**: values on the left branch are smaller than the values of the right branch


## Searching Algorithms

#### DFS
+ use call stack


  ```ruby
  class Tree
    def dfs(target_value)
      return self if self.value == target_value

      children.each do |child|
        node = child.dfs(target_value)
        return node if node
      end

      nil
    end
  end
  ```

#### BFS
+ use queue


  ```ruby
  class Tree
    def bfs(target_value)
      queue = []
      queue << self

      until queue.empty?
        node = queue.shift
        if node.value == target_value
          return node
        else
          queue += node.children
        end
      end

      nil
    end
  end
  ```

#### Assessment Prep

```ruby
class Array
  def my_inject(accumulator = nil, &prc)
    if accumulator.nil?
      accumulator = self.first
      index = 1
    else
      index = 0
    end

    while index < length
      prc.call(accumulator, self[index])
      index += 1
    end

    accumulator
  end
end
```
