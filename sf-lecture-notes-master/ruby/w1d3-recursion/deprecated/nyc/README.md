[June cohort:  Leen](./previous_lectures/june2016.rb)  
[Aug cohort:  Maurice](./previous_lectures/august2016.rb)

## Solutions prep

**Expect questions on:**
+ ARGV in `memory.rb`.
+ `STDIN.gets`. `Kernel#gets` reads from ARGV and other sources (show documentation!). Since our code uses ARGV it's good to be explicit.
+ Destructuring arrays in `#unmatched_pos` and `#match_previous`
+ Splat operator (people really want to use this in the bracket methods)
+ Private attr_reader vs instance variable
  + Better catch for typos. Typo an instance variable and you'll accidentally create a new variable.


**Point out:**
+ `#==` method in Card class
+ Duck typing. Useful in Memory class.
+ Bracket methods. `Board#[](pos)` is just an alias for `Board#get_card(pos)`. But ruby lets us call bracket methods in special ways. All arguments can be passed in between brackets
  + `board.get_card([1, 2])`
  + `board.[]([1, 2])`
  + `board[[1, 2]]`
  + Same for `[]=(pos)`. All arguments passed in between brackets except for the last one.
  + COMMON MISUSE of bracket methods: `board.grid[1, 2]`, not `board[1, 2]`. Uses Array#[] instead of Board#[]



## Lecture

**1) Idea of recursion**

+ They've watched videos. Ask THEM to tell you.
+ Two things: base case and inductive step.
  + Inductive Step
  > How you combine solution of smaller problem with new information to find the solution to your bigger problem.
  Maurice

+ Wrap up with demo. For example: Someone is buying coffee for the entire line. Can't see end of line. Asks person behind him. Who asks person behind him. Who asks....
+ What is the base case? What is the inductive step?

**2) Fibs**
+ Explain what fibs are. Find first few fibs with the class.
+ Let them try to write a method `fibs(n)` which returns the first n fibonacci numbers.
+ Point out storing recursive call in variable. Show how much slowing it `fibs(20)` is if you make two recursive calls within each call.


**3) Solving recursive problems**

+ If they need it, go over quicksort (from video).
  + base case
  + inductive step
+ Advice for figuring out inductive step. Work in the context of ONE call. Assume that previous call worked perfectly.
