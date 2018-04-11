# W1D3 Recursion
Note: 
Introduce myself
First new topic they've seen, excited to show them 
---
## Agenda
* Recursion Intro 
* Recursion Demo
* Quiz solution
Note: 
We have something special for you planned during the demo 
---
# Recursion
Note: 
As you saw last night, recursion is another approach to solving problems that just doing so iteratively. Often times, as we will see today, it can be a much easier and more elegant approach to solving certain problems. 
---
## What are the properties of a recursive function?
* Calls itself (recurses)
* Solves a problem by reducing it to similar subproblems
* Has a base case and an inductive step
Note: Inductive step is how we use the return value of the previous step to determine the current result
---
## Movie Theater Example
---
## Steps to Approaching a Recursive Function
1. What type of data will we return? 
2. What is/are the base case(s)? 
3. How can I break this into sub problems? 
    * Aka the inductive step (assuming previous step)
Note: 
1. Data Type - Important that Inductive step and base case BOTH return the data type we expect to return 
2. There could be more than one 
3. Tie in movie theater exaple 
---
## Demo

---

## Pascal's Triangle

![triangle](http://www.dbriers.com/tutorials/wp-content/uploads/2010/02/pascal.gif)

What type of data will we return?

What are the **base-cases**?

Induction: Assume we know the answer to the previous step.

Note:
talk about how this is a good candidate for a recursive solution because each row depends on the row above it

ask audience for base case/s

discuss the inductive step

walk through this with row = 2, drawing the stack on the board

talk about how to implement the inductive step

show `pascals_triangle.rb`, run test cases

unmemoized pascal_row(10): 88,573 function calls

memoized: 10 function calls

---

## Quiz

* [Solution](https://github.com/appacademy/daily-quiz/blob/master/ruby/w1d3.md)

---

# End of Lecture
![recursion](https://media.giphy.com/media/xlTwaFb20TVjW/giphy.gif)
---

## Homework

* [Questions](https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/recursion/README.md)
* [Solutions](https://github.com/appacademy/curriculum/blob/master/ruby/homeworks/recursion/solution.rb)

---
Note:
From yesterday that may linger into today:
common mistakes if nobody has questions:
* Not breaking up classes into separate files
* Not using syntactic sugar methods
* `__FILE__`, `$PROGRAM_NAME`, `ARGV`

show syntactic sugar demo:
```
load "board.rb"
b = Board.new
b[[1,1]] # <# Card >
pos = [1,1]
b[pos] # <# Card >
b[pos] = 7
b[pos] # 7
b
```
---