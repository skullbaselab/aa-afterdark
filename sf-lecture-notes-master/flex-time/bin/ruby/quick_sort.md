# Quick Sort
  * What to cover?
    1. How does quicksort works?
    2. Quicksort without procs.
    3. Quicksort with procs.

## How does quicksort work?

Before walking them through the code, use the whiteboard to explain the algorithm. It is always useful to guide them through how the algorithm works, as this is a recursive algorithm, show them how each time we call the recursive function a new stack is set in memory.

```ruby
stack 1
=========
array = [3,2,1]
pivot_val = 3
less_than =  ? ## filter anything less than and then call recursive call
greater_equal_than = ? ## filter anything greater or equal, then call recursive call


stack 2
=========
## this stack is create after calling our quick sort function on the array [2,1]
array = [2,1]
pivot_val = 2
less_than =  ? ## filter anything less than and then call recursive call
greater_equal_than = ? ## filter anything greater or equal, then call recursive call


stack 3
=========
## Keep illustrating the stack calls until the problem is solved
```

Make sure to use the whiteboard to its fullest, be extra clear on what the result of each stack is and where is the return value from such function stored after the return.

**NB:Don't erase your callstacks, if possible, as this will help us while writing the code.**

## Quicksort without procs.

For the first run, don't worry about procs for the comparison of objects, it's easier to understand quicksort at the beginning if we only restrict ourselves to the regular <=> comparisons.

Use the stack you previously created and follow along with the code you will be writing, use the same variable names you used on your stack representation. Ask your students how they want to tackle this question, monkey patching or with a regular function. The following example is of a _monkeypatch_ quicksort

As this is a recursive algorithm, make a clear distinction between what the **base case** and **inductive steps** are.

For the base cases ask students if [] and [x] are already sorted, this will give them a clear idea of the base case to code.

```ruby
class Array
  def quicksort
    return self if count <= 1 ## Explain that because we are monkey patching we have access to count/length just by calling the methods.

    pivot_val = self.first ## we can pick any pivot value, for simplicity here we use the first value
    less_than = self.drop(1).select { |ele| ele < pivot_val }.quicksort
    greater_equal = self.drop(1).select { |ele| ele >= pivot_val }.quicksort

    ##explain why we need to drop the first element of the array, in this case, we do so because we don't want to have the less_than or greater_equal array to take into consideration the pivot value we took for the pivot.

    ## some students won't get it the first time why we need to wrap the pivot value around [], explain them the error they will face if they don't wrap it and why.
    ## In this case TypeError: no implicit conversion of Fixnum into Array awaits if they don't.
    less_than + [pivot_val] + greater_equal
  end
end
```

One the most common bugs is that students forget to call `quicksort` on the arrays after the select.

There will be a couple questions about complexity or how efficient is to create sub copies of the array in the `self.drop(1)`, the above algorithm could be more efficient, but in the end, the goal is for them to understand the algorithm.

## Quicksort with procs.

Explain any question regarding the algorithm we just coded, then present your students with the following question, *will our current algorithm work for any other object other than Fixnums, or order in descending order?* The answer is no, the algorithm we just coded will only work for `Fixnums` and will sort them in ascending order.

In order for our algorithm to be more flexible and generic, we need to accept `Procs`, the proc will do the heavy lifting, determining if an object is greater/equal/smaller than other object provided. That being said, the proc should adhere to a basic principle:
  * If x < y return -1
  * if x == y return 0
  * if x > y return 1
How we decide which object is less/equal/greater is up to the developer, if not specified go with the default approach.

With that in mind, modify the previous code to accept procs.

```ruby
class Array
  def quicksort(&prc)
    return self if count <= 1
    
    ## note that we are not defaulting prc to a default value.

    pivot_val = self.first
    less_than = self.drop(1).select { |ele| prc.call(ele, pivot_val) == -1 }.quicksort(&prc)
    greater_equal = self.drop(1).select { |ele| prc.call(ele, pivot_val) >= 0 }.quicksort(&prc)

    ## Explain why we need to use & when passing the prc again and what happens when we add a & to a proc (we bloc-ify the proc).

    less_than + [pivot_val] + greater_equal
  end
end
```

After finishing this piece of code, ask your students what would happen if there is no prc used in the call.

```ruby
[3,2,1].quicksort ##no proc
undefined method `call' for nil:NilClass
```

Go back to your code and add the default proc.

```ruby
class Array
  def quicksort(&prc)
    return self if count <= 1
    prc ||= Proc.new {|x,y| x <=> y}
    pivot_val = self.first
    less_than = self.drop(1).select { |ele| prc.call(ele, pivot_val) == -1 }.quicksort(&prc)
    greater_equal = self.drop(1).select { |ele| prc.call(ele, pivot_val) >= 0 }.quicksort(&prc)

    ## Explain why we need to use & when passing the prc again and what happens when we add a & to a proc (we bloc-ify the proc).

    less_than + [pivot_val] + greater_equal
  end
end

## Sort in the reverse order
[1,2,3,4].quicksort do |x, y|
  y <=> x
end
```