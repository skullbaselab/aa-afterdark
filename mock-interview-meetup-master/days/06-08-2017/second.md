## Partner B interviews Partner A

## Well-formed String (20 min)

A string with the characters `[,],{,},(,)` is said to be well-formed if the different types of brackets match in the correct order.

For example, `([]){()}` is well-formed, but `[(]{)}` is not.

Write a function to test whether a string is well-formed.

### Solution

* The applicant may assume that the string is only composed of these characters, although they may also deal with any string.
* This is the perfect situation for a stack.
* If we store all left brackets in a stack then every time we encounter a right bracket, its pair should be on the top of the stack, or else it is unmatched.
* Additionally, if there are any unmatched left brackets at the end, the string is not well-formed.

```ruby
def well_formed(str)
  left_chars = []
  lookup = { '(' => ')', '['=> ']', '{'=> '}' }

  str.chars.each do |char|
    if lookup.keys.include?(char)
      left_chars << char
    elsif left_chars.length == 0 || lookup[left_chars.pop] != char
      return false
    end
  end
  return left_chars.empty?
end

str = '[({})]'
str2 = '({)'
p well_formed(str) == true
p well_formed(str2) == false
```

---
## Install Order (45 min)

Given an Array of tuples, where tuple[0] represents a package id, and tuple[1] represents its dependency, determine the order in which the packages should be installed. Only packages that have dependencies will be listed, but all packages from 1..max_id exist.

N.B. this is how `npm` works.

Import any methods or data structures you need to.


### Solution

* Don't give away the idea unless the applicant is badly stuck
* This problem implies graphs and topological sorting
* The applicant is not obligated to implement these methods themselves



```ruby

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  # find the max package_id so we can create entries for which there are no dependencies
  max = 0
  vertices = []
  arr.each do |tup|
    max = tup[0] if tup[0] > max
    max = tup[1] if tup[1] > max
  end

  # create vertices for each package
  (1..max).each do |i|
    vertices << Vertex.new(i)
  end

  # find the vertices by value and create edges
  arr.each do |tup|
    to = vertices.select { |v| v.value == tup[0] }[0]
    from = vertices.select { |v| v.value == tup[1] }[0]
    Edge.new(from, to)
  end

  # return a map of the values from the topo sort
  topological_sort(vertices).map { |v| v.value }
end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1]]
p install_order(arr)
```
---

Now a slight modification:
In this version of the problem, all packages will be listed, (independent packages have nil value for their dependencies), but the package ids are not numbers.

```ruby
def install_order2(arr)

  # create a hash to store the vertices and their dependencies
  vertices = Hash.new { |h, k| h[k] = Array.new }

  # iterate through the tuples
  arr.each do |tup|

    # finding the Vertex if it is already a key, else create it
    existing_vertex = vertices.keys.select { |k| k.value == tup[0] }[0]
    vert = existing_vertex || Vertex.new(tup[0])

    #store the dependency, or initialize the key with a blank array
    tup[1] ? (vertices[vert] << tup[1]) : (vertices[vert] = [])
  end

  # create edges by finding the keys corresponding to the dependents and dependencies, all packages will be keys
  vertices.each do |vert, deps|
    deps.each do |dep|
      dep_key = vertices.keys.select{ |k| k.value == dep }[0]
      Edge.new(dep_key, vert) unless deps.empty?
    end
  end
  topological_sort(vertices.keys).map { |v| v.value }
end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1], [1, nil], [5, nil]]
arr2 = [['a', 'b'], ['c', 'b'], ['d', 'a'], ['b']]

p install_order2(arr2)
```
