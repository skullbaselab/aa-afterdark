# Recursion

+ Walk through subsets, usually the best way to show a semi-comprehensive recursive method with iterative aspects

+ Emphasize that recursion is a totally different approach from iteration, and should be considered separate, but complementary

+ Also emphasize never to use a recursive call in a loop unless you _absolutely_ know what you're doing.

```ruby
def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr.drop(1))
  subs.concat( subs.map { |sub| [arr.first] + sub } )
end
```

+ **DO NOT START BY WALKING THROUGH THE PROBLEM!**

+ Start by **diagramming the recursive stack**, tracking variable values for each recursive call as you do so, **drawing arrows from one call to the other to emphasize where return values travel** as they bubble up the stack.

```ruby
subsets([1,2,3]) # Call #1
subs = ?

subsets([2,3]) # Call #2
subs = ?

subsets([3]) # Call #3
subs = ?

subsets([]) # Call #4 (base case)
subs = [[]]
# Then illustrate how the base case bubbles up the stack to construct the final result
```