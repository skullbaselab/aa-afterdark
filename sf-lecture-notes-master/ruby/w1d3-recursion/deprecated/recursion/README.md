# W1D3

---

## Roll Call

---

## Questions From Yesterday's Work

---

## Recursion
+ calling a function from within its self
+ can do any iterative thing recursively
+ (that doesn't mean you should)
+ some stuff makes sense (tree traversals, searches, sorts)

---

## Imagine...
+ movie theatre metaphor
+ can't see, but can feel the person in front
+ what might the algorithm for finding out what row you are in look like?
+ **demo: write this in ruby**

---

### Which Row
```ruby
class MovieGoer
  def initialize(person_in_front = nil)
    @person_in_front = person_in_front
  end

  def row_num
    if @person_in_front
      1 + @person_in_front.row_num
    else
      1
    end
  end
end
```

---

### Strategy
+ start with the base case
+ come up with the base case + 1, using the base case some how
+ make sure every step brings it closer to base case
+ trust that it works and celebrate

---

### SystemStackError: stack level too deep
+ every function call adds a frame to the stack
+ frame goes away when function returns
+ can only hold a few thousand frames and then: stack overflow!
+ common error with recursion
+ **demo: induce a stack overflow using shitty_sort**

---
### More Examples: Powers of Two
+ demo on board returning integer
+ demo on board returning array

---

### More Sophisticated: Quicksort
+ you just keep dividing the elements in half
+ little things on the left, big things on the right
+ then put them all back together
+ divide and conquer!
+ **demo: quicksort**
---

### OPTIONAL (If Time)

- Asher Haiku Exercise: I want to try a little exercise, I've never tried this before
  - Everyone writes down a haiku on an INDEX CARD

___

### Key Points
+ meaning of recursion
+ 'the stack' and stack frames
+ what causes a stack overflow
+ strategy for solving recursive problems
+ fundamentals of quicksort

---


# END
