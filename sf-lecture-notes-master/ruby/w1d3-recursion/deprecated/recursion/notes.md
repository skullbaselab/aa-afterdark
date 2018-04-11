Many students struggled with returning arrays from recursive problems

## Recursion
+ Components of a solution:
  + Base case
  + Reduction step (alternatively, simplification step): get closer to base
+ Pitfalls
  + Returning different data types: especially easy with base vs. general case
  + Failed reduction step (for some or all cases)
  + No base case (self explanatory; either stack overflow or erroring out can result)
  + Unnecessary multiple recursive calls (exponential time growth)
+ Application
  + Searches (DFS, Binary Search, etc.)
  + Sorts (quicksort, mergesort, etc)
  + Descent parsing
  + Fractals (Sierpinski triangle)

**Whiteboard DEMO**:
+  Be sure to demo an example of returning a number and an array
  + Factorial of N (or fibs, or powers of two, etc.)
    + danger of multiple recursive calls (e.g. fibs(n-2) + fibs(n-1))
  + Array of factorials of first N numbers
+  Draw out the call stack showing it build up and then return back down
+  Both of these are basically linear: reduce by 1 to trivial cases, build back up

**Code Demo**:
+ Quicksort: "divide and conquer" algorithm: splits problem into multiple,
  easier subproblems
  + show simple example on the whiteboard too
```ruby
def quicksort(array)
  # base case: len <= 1; we know it is sorted
  return array if array.length <= 1
  # general case: break up array into components, reducing towards base;
  # worst case, all we do is remove pivot, but we're still reducing the array
  pivot = array[0]
  left, right = [], []
  array.each_with_index do |el, idx|
    next if idx == 0
    if el <= pivot
      left << el
    elsif el > pivot
      right << el
    end
  end
  quicksort(left) + [pivot] + quicksort(right)
end
# optimizations: random pivot, group into left/equal/right
```
+ Plan out the problem; identify a base case and a reduction step before you begin

# Projects
## Word Chains
