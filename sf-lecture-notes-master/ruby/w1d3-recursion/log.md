# W1D3

## 02/14/2018

+ Lecturer: AJ

### Questions

+ In the examples we've seen, base cases have been a single unit, `0`,
`""`, `[]`, etc?
+ Is it acceptable to have two base cases, one to recurse to and one to
catch negatives (movie theater example)
+ Are all inductive steps the same or can they depend on which step
(row) it is currently on?
+ How often is recursion used in the field?
  + Not every day, but you need to know how to write and read them when
the time comes
+ Recursion is slower, why would we use it?
+ Is there a way to change the size of the stack?
  + Yes, but if you need to you're probably doing it wrong
+ Is iteration using a loop?
+ How can we determine when to use iteration or recursion?
+ Isn't there a main stack too?
  + Yes, that is definitely true. When talking about recursive problems
though, we are really only concerned with the recursive stacks
+ Is it okay to call the function itself twice?
  + Totally.
+ Do we need to know how many times a function is called recursively?
+ Is a stack one action the computer does with all the data in it?
  + Yes, it's each separate method call
+ Are there any other base cases we could have used?
+ Is adding `[n]` be the same?
+ Should we pull the memoization into it's own helper function?
  + That's definitely useful, but since it's just an array for this
problem it's probably not needed. If the function was bigger, we would
want to do that
+ Is there any other object that operates like an options hash?
  + No.
+ Does the options hash have to be at the end?
  + Yes. If it's an earlier argument, it must be wrapped in curly braces


# Dec 6, 2017
* Lecturer: Kelly Chung
* Notes: Cynthia Ma

## Global Variable Q's
* What is the difference between loading a file in pry using loading 'filename.rb' or execute the file in terminal using ruby filename.rb
  * comes down to if you want to execute the file right away
  * execute file with terminal: the file will execute right away since the $PROGRAM_NAME is the same as the __FILE__ name
  * loading file with pry: $PROGRAM_NAME is pry while __FILE__ is still the name of the filename

* What does `ARGV` mean?
  * `ARGV` stands for argument vector. vector meaning one dimensional array of strings.

* What happens if `ARGV` has two arguments?
  * must be separated by a white space.
  * ARGV will convert the arguments into an array of strings. 
  
* Is `ARGV` a constant?
  * yes

* is the `ARGV` arguments always split by white spaces?
  * yes

 
## Recursion Whiteboard Demo Q's
* Doing fib's sequence iteratively makes so much more sense?! Why would we write it iteratively.
  * All recursions questions can be answered iteratively. It does come down to preference. However, coding it recursively may be more elegantly. Try to code quick sort iteratively!
  
* Come assessment time, do we need to code it recursively?
  * yes
  
* Do I approach recursion a top-down or bottom-up approach?
  * top-down: general --> move to base case. drop to the base case and move upwards
  * bottom-up: look at the base case and build up.
  * those 2 processes are similar. you do you. in general, its hard to make these generalization of recursion. 
  * the fundamental definition of recursion is that it is a function that calls itself with its body. 

* how can you be both iterative AND recursive?
  * each recursive problem is an iterative problem!
  * generally speaking: if the function calls itself within itself, it is recursive.
  * whether it has iterative STEPS, that is another issue.
  
* is the code demo demonstrating binary tree
  * hold up, not everyone knows what a binary tree is YET.
  * move question to open forum.

* we are not storing any results in the fib sequence example, can we explicitly store things in memory?
  * in the code demo, we will be looking into memoization. 

## Recursion Code Demo (Improved, faster, version) Q's

* auto complete for atom sucks. how do i get rid of auto complete snippets?
  * end would autocomplete into render
  * in the auto-complete plus, change autocomplete key to 'tab' instead of space.
  
  * you can delete it 
  * space after method name 
  * if you and your partner agree, you can disable autocomplete-plus. just re-enable it back again at the end of the day.

* would it be more consistent with programming languages to consider 0th to the first term instead of the 1st to the first term? fib(0) = 1 OR fib(1) = 1
  * just depends on how you defined the problem to the user.
  
* can you just old_seq.push(next_value) ?
  * push will mutate the array. we will try to avoid in this case.

* can we call old_seq.dup + [next_value]
  * that works too but ruby allows you to do things multiple ways. however there are rubyists who have strict code guidelines.

* dont we sacrifice performance by making copies?
  * in all cases, its about performance. are you just looking for space and time efficiently or being able to debug code well?
  
* for future reference for the sake of debugging?
 * don't mutate unless it is intentional! you dont want to hit any bugs by mutating your data.

## Quiz Q's
* how do we change the stack limit in ruby?

  

## Notes for Kelly
* Consistently double checking if people can see the board. Awesome.
* Consistently repeating questions that were asked. Awesome P'awesome. 
* Recapped information after break.

## Immediate Action
* command + shift + enter doesn't work on some of the school computers.   
* slack out the popular atom packages for atom.

# Oct 4, 2017
Lecturer: Aaron
Notes: AJ

## Global Variable Q's
* Why does RuboCop tell us it should be flipped?
  * We should compare things by saying, is this variable equal to this constant, rather than visa versa. Additionally,
    program name is a
* It's only necessary if you have intent to use pry or to debug?
  * Yes, absolutely.
* Can we write it the other way?
  * Yes, we can. It's just convention to write it this way instead.
* Can you define the difference between the two
  * __FILE__ is the file name where $PROGRAM_NAME is the command we ran
* If you require something relative in a file is that the $PROGRAM_NAME?
  * Yes it would be
* Is $0 different?
  * We'll check on this later (open forum?)
* What if we put a more complicated object in, would it convert it to a string?
  * Yes, but everything must be separated by a space
* Can we renamed ARGV
  * Not sure, we can look at that later though
* When we call the specific argument in the array, i.e. ARGV[0], it doesn't look like a string?
  * Because we are interpolating it, it puts it to the screen, but it is indeed still a string
  * Using "p" will show the quotes, ensuring it is actually a string

## Recursion Whiteboard Demo Q's
* Can we use each_cons?
  * Yes, we definitely could but we are going to approach it this way.
* Could pairs be assigned to something like n?
  * Yep, we could name it anything that we wanted.
* Could we shovel it in?
  * Again, it will return the value rather than the new array
* Can we go through the demo of what this will look like? What happens when we get to num of 0?
  * Great question, we're going to go through the stack next
* What happens when we chain methods?
  * The first method will return before we call the next method, then calls the next method on that return value
* What is the stack level that you have?
  * Great question! We have around 9000 stacks.
* Does pascal of n-1 have to go back through the call stack?
  * Yes, and we are going to get into why that could be a problem in a few days.
* How many stack frames were used for this program?
  * There could be things under the current function that calls it, i.e. main, the program name, methods that call this one, etc.
* Wouldn't it be three times four?
  * When we talk about the call stack we talk about the maximum stack height, which is around 9-10 thousand
* Could we have done the pairs in
* How does the #times function work?
  * We can add it on to any integer and it will iterate from 0 to pairs minus 1.
* Do the built in functions like times, minus, etc. also get added to the stack?
  * Yes, it does. They will definitely be on there too. But, we want to talk about the recursive stack frames, not the absolute stack frames.
* Could we store pascal(n-1) in a variable to help with the stack frames?
  * Absolutely, which we are going to get into and start practicing.

## Recursion Code Demo (Improved, faster, version) Q's
* How do you spell it?
  * Memoization
* What is the time complexity?
  * We will get into that next week.
* Is there a length on fixed num?
  * Not sure, we can look into that, but I'm sure there's a way to deal with it.

## Quiz Q's
* How would you come up with names and argument names for a very polymorphic num?
  * You're doing a lot of math within this function so use this information to understand better ways you could rename your functions / variables. We want our code to read like english.
* Could you give some examples? I felt like the naming of these argument names and variable names were pretty good?
  * We need to ask ourselves what it is doing for us? What will it be doing next? Be more descriptive so we know more information than what order the arguments were passed in.
* Can we set a variable equal to the options hash in the params?
  * No, we cannot.
* Can you explain the option part of the arguments?
  *
* Could we have used the rocket-hash notation?
  * Yes, but we highly recommend using the newer, symbol notation
* Is this best practice?
  * Yes, it is. As we move into rails, rails takes full advantage of this and lets us declutter a lot of what we are doing. Everything will start to look compact and be easier to read.
* Can we use the splat operator along with the options hash?
  * I don't think so, but we can look into it.
* Do we need to check if the thing we are passing in is a string or not?
  * This is a great example of duck typing, upcase is doing this behind the scenes, and knows what to do whether it is a string or not. We will do similar things and it is important to name the functions the same for each class so that it will behave this way.
* Would this be n + 1?
  * Remember, we only want to talk about the recursive call stacks.

## Notes for Aaron
* Excellent job asking them questions during the code demo and getting their feedback on what we should do next rather than just telling them how to do it.
* Great job clarifying that there are multiple ways to approach a recursion problem.
* Thorough explanation as to why we shouldn't push 1 onto our array because our return value would be 1 rather than the new array, thus here it would be good to use concatenation
* Unfortunately there was a ton of construction going on in the background and it was a little difficult to hear the beginning of the Lecture.
* Write a little larger, it was slightly hard to see from the back.

# Aug 2, 2017
Lecturer: Aaron

## Q's
* When num is 1, does that mean we will hit our base case on the recursive call?
  * Yes.
* Shouldn't that be row 3 (it is row 2)?
  * Our rows are 0-based.
* What is the time-complexity?
  * Rediculously bad. We'll cover time complexity next week.
* It looked like it just reduced the coeficient of the time complexity??
  * It reduces much more than that. Look at the #times call.
* As we go through this, is there a way to return just what is at the top of the stack?
  * No.
* If we are not using recursion, and we are just calling a bunch of methods, is that adding to the stack?
  * Yes. Every method call that stays open (prior to returning) is adding to the stack.
* When tackling recursion, where do you start?
  * You can either start at the base case or start at the inductive step. I like thinking first about the data structure?

## Homework Qs
* Can you go over the gama_fnc?
  * He does.
* If we store `num - 1` in a variable, I was getting a stack overflow... I don't know why?
  * Code Demo FTW! It works. No overflow.
* Do we need more than one base case?
  * It depends on the function. If you have unique cases, then yes. You want to prevent a stack overflow and handle expected edge cases.
* Is it okay to use helper functions that are recursive?
  * Yes, but some of our tests specificially test for a function to call itself.
* Can you walk through the #ice_cream_shop?
  * ...walks through prob...
* Is it a new array (after the #[0...-1])?
  * Yes it is.
* What happens when we mutate the original array?
  * We get a lot of potentially unexpected consequences.

## Quiz Qs

* We can only omit the curly braces if it's the last arg?
  * Correct
* If we do a splat to accept args with an options hash (sans curl braces), what will the array look like?
  * We get the hash as one spot in the array.
* Is #map iterative?
  * Yes. That is what makes this iterative.
* Do we ever mix recursion and iteration?
  * Yes! All of the time. Pascal's triangle is an excellent solution.
* Is there sometimes when recursion is better than iteration?
  * Sometimes it's easier to write, but iteration is typically more efficient.
* Does this include the main stack frame?
  * No. (It might... It returns at n == 1 rather than opening a new call. Have to check.)


## Notes for Aaron:
* Make sure to write large. Hard to read from the back.
* Make sure to use a dark marker.
* When you will be running code in the console, experiment with different layouts to make sure we can read it in the back.
* Mic got quiet at the end?
* Wrap it up at the end. A lot of the things they had questions about were things they could easily test themselves.



# May 31, 2017 - Lecture W1D3
Lecturer: Dallas
* Q is a main question
* q is question a sub question of a main topic being asked

# Questions from yesterday's assignments

### Question 1: Instance variable calling from one class to another?
Can't reference an instance variable directly; must access through an instance of that class
(Looking at board class)

@board = Board.new
Board is an instance; call @board dot whatever the reader/accesssor is

#### q: Use of @ symbol?
anywhere within the same class, if there's in attr_reader, can access via self

#### q: IF you're in another class, how do you access this instance?
Need to pass in directly via method


### Question 2: Coding style wise? @ vs attr_reader
Answer 2: Personal pref is @ symbol, it's a bit more clear
Either way is fine as long as justify reasons

### Question 3: Some Ruby style guidelines recommend against ternary? What should we do?
Answer 3: At first, ternary operators are hard to use
(Dallas asks follow up to make sure everyone knows what ternary operator is)
Personal preference: use them all over for simple operations; for complex, break out into if/else

#### Redundant ternary (@given = value == 0 ? false : true )
Answer: 0 is not falsey in Ruby

### Q4: require vs require relative
Require: gems installed locally or on machine
Relative: loading files you've written yourself in projects
../ to move up directory
Example: require_relative "board" in sudoku

### Q5 (didn't hear question); about "board" vs "board.rb"
In ruby, don't need to specify extension

### Q6 In memory, in solution under board, there are private things (attr_reader :rows)
Attr_reader here so we don't have to use @ within this class
But don't expose it to other classes
board.rows will not work from another class

#### q: change attr_reader to attr_accessor?
accessor won't give you any benefits here

#### q: why is it at bottom?
All private methods are at the bottom
Everything underneath private keyword are private, so typically we put it at end of code

#### q: if attr_reader wasn't private, would it function the same?
Yes; difference is from an outside class, you would be able to access the rows (would be like cheating)

### Q7 def ==(object) can you explain this method?
Syntactic sugar in Ruby
You can compare any object to another object use ==
You can override it for a class as well!
If we have two instances of these cards, if there both a card and have the same value, we consider them equal
EX: Card A has value of A
EX: Card B has value of B
Card A == Card B
Card B is a card and has the same value of A

#### q: When using this == method, are we saying these objects have these same id's?
Generally yes in Ruby; arrays, strings have their own == methods
Default behavior though is comparing object id

#### q: What is the object id ?
Every object in ruby has a unique id
Only time two objects are same are if we override == or have two pointers referencing same object

#### q: Is it better to compare class first or values?
This is a safe way to compare: every object has a class, but not every object has a value

#### q: Can I override other operators?
Yes you can! Look at Ruby docs (using 2.3.1), and you can see which ones you can override
Ruby allows you to override a lot of stuff
In CodeWars, you can override == to always return true!


## Use Syntactic Sugar Methods!

### Q: Is Syntactic sugar only for arrays?
No, there are many types (like ==)

### Q: b[pos] = 7, is that setting both elements of position pair to 7?
No, it sets whatever at that location [pos] (which is a [row, col] pair) to 7

### Q: where to find syntactic sugar methods/ideas ?
StackOverflow is awesome resource

### Note: Dallas handled audio problem very well

### Q: Tips on rendering the board?
Iterate over each row, print a mapped version of what is in row; or nested loops

## Helper Global Variables = __FILE__ , $PROGRAM_NAME

### Dallas asks question to class, student answers, dallas reiterates answer:
Tests to see if we are running that file directly, or if we are testing it

### Dallas gives super awesome demo on how it works
Showing running ruby filename.rb vs pry

#### q: What is going on?
__FILE__ is global variable pointing to file
$PROGRAM_NAME is global variable pointing to the program that is running
* When opening in pry, program running is pry

#### q: Why is this significant?
If I want to play Memory I can type ruby memory.rb, and ready to play the game, everything is great
If I want to test, I could go into pry, load it, and not have to worry about it starting a game

## ARGV

### Q: Why does Bon Jovi have quotes
You can put in a string explicitly as a command-line arg

### Q: Real life example of use case?
Let's say running sudoku game, and I have 1000 different games
Two ways:
* I can say ruby sudoku.rb 3, and it will load that game
* Or, can ask user what game they would like to play

# Recursion

## Pascal's Triangle
Always ask these two questions:
* What type of data do I want to return?
* What is the base case, the escape, or the smallest thing we know to exit our recursion?

### Whiteboard
```ruby
def pascal_row(row)
  return [1] if row == 0

  cur_row = [1]
  prev_row = pascal_row(row - 1)

  (prev_row.length - 1).times do |i|
    cur_row << prev_row[i] + prev_row[i + 1]
  end

  cur_row + [1]
end
```
* **Base Case** ```row == 0 #=> [1]```
* Let's say we start at row 2, now what? Inductive step needs some subtraction to get to 1
* Let's notice:
  * All along the left side, there are ones
  * All along the right side, there are ones
* What if we say [1] + some_middle_function + [1]
  * How do we get middle? Assume we have previous row (let's assume one level below)
  * We already have the left side of current row ([1])
  * To get middle, we can iterate through previous row using .times
    * .times starts at 0, so ```i``` will start at 0



### Q: Is explicit return always necessary in base case?
99% of the time, yes

### Q: Is it important to find inductive step first?
Haseeb does inductive step first, dallas prefers exit strategy first (base case); good use of humor
Both are critical though

### Q: Walkthrough when row is equal to one?
* When row is 1, curr_row is [1]
* prev_row is pascal_row(row - 1) is pascal_row(0), which returns [1]
* prev_row.length - 1 is equal to 1 - 1, which is 0
  * 0.times will not execute, so no middle is set
* Thus we have curr_row, [1], + [1] to get our 1th row

### Q: How did we Fix problem we had?
Times acutally starts at 0, so we add 1 to i instead of subtracting 1 from i

### memoizing?

### Are there examples of recursion where you need a recursive function to require a helper function?
I'm sure there are; anything you can recurse over, you can always iterate over (though it may be difficult to devise a solution). Finding the first 5 prime numbers can be done in iterative block and recursive sub step

### How would I use this to build the whole triangle?
I would do this iteratively (6.times do |i| { print pascal_row(i)})

### Are function calls more memory intensive than iterative calls?
It depends; time complexity lecture coming up, you'll see it soon

### How do we get to the point where we can naturally write stuff like this?
You guys have assessment coming up, and it has... recursion! You'll start seeing patterns, and as you learn them, you'll have an easier time thinking recursively. Friday lecture: DFS and BFS

# Homework

### Ice cream solution walkthrough?

#### q: Pop modifies original?
Yes

#### q: Non destructive way?
flavors.last instead of flavors.pop. Use [0...-1] in recursive call to ignore last element.

#### q: A lot of solutions use pop to mutate original argument, best practice?
Not best practice to mutate arguments

### ** NOTE: ** make non-destructive version for ice cream!

#### q: Can we do the non-destructive version?
Yes (dallas does demo)

#### q: could we do flavors[0..-2]
Yes, but [0...-1] is a little more clear/readable

#### q: Why would flavors.empty? return false when we aren't modifying array?
When we are doing recursive call, we are passing a new array (flavors[0...-1])

#### q: when we use arr[0...-1], is this a new array in memory?
Yes, it doesn't modify original. You can modify one without affecting the other (they are different arrays in memory).

# Quiz

## Q2 on quiz

### Q: options hash related questions:

#### q: For options hash, can we just refer to the symbol names rather than options.hash?
Yes

#### q: best practice?
Do the first way (non-explicit passing of options hash into a method)

#### q: symbols or rocket hash?
symbols

#### q: only works when hash is the last argument?
Yes; if you need to pass non-last argument hashes, must explicitly pass a hash as an argument

#### q: alpha course uses rocket-hash?
We are re-writing alpha course currently

#### q: if we do this the top way (leaving out curly braces), how do we call them (symbol vs variables)?
Get back to you, will post in slack

#### q: Can you use dot notation or should use brackets?
Use brackets in Ruby; dot does not work in Ruby

#### q: Demo?
Yeah (dallas does demo)

#### q: Does no curly work?
Yes as long as hash is last in argument list.

## Q3

### Q: is there a way to change number of stacks?
Yes, in readings there is snippet of code to reduce num of stacks when testing.

## Q4

### Q: upcase in array?
We are calling upcase on string in map; defining an upcase method on Array class

## Q5

### n vs n-1 or n+1
Have a call for each n
Add Comment

---

## 3/29/17
Lecturer: Luke Wassink

### Project Questions
- In the player file, why are we using instance variables?
- In Sudoku we used a factory method. What is that?
- Would you have to put Board.new in a factory method to create a board?
- Are there any uses of class methods other than factory methods?
- I don't understand the get_position method in Sudoku
- A question about Ruby's dup method
- IO file class: what does f.gets do ?
- Can you give a quick example of duck typing?
- What is a good way to decide which method goes in each class?
- Can you go over shallow copying again? with a whiteboard example?
  - Luke walks through a shallow and deep dup of an array on the board
  - follow up questions about mutability

### Recursion Demo
- Why do we return nil when we pass in a negative number? (A question
  about handling different inputs in recursive functions)
- What is the ruby virtual machine?
- How many stacks will be made available to you?


### Quiz
- How do we name variables in a descriptive way?
- Is hash key, value assignment syntactic sugar?
- Do options hashes always work?
- Can we use hash rocket notation for hashes?
- Can we have multiple options hashes?
- How would we break longer lines of code into more, shorter lines?
- Do you need to expect an argument in a method signature when passing in a hash?
- Does this (the options hash) also take a splat operator?
- In the video, kernel was counted as a stack frame. Why is it not counted in the quiz?
- What is `self` if we define a method on the Array class? What does `map` feed in?


## 1/25/17
Lecturer: Gage Newman

### Questions

**Memory**
+ Why do we have a private `attr_reader` in the `Board` class?
  + so we can get away without using @ in front of variables
+ What is the `shuffled_pairs` method in the `Card` class doing?
  + it's a factory method
+ What does `take` do?
  + demonstration
+ Why do we shuffle twice in the factory method?
  + to shuffle the cards better
+ What are the duck typing methods?
  + giving classes similar enough interfaces that other classes don't have to care what class they are. will talk about it more next week
+ How is that different from creating a parent `Player` class and two children `HumanPlayer` and `ComputerPlayer` classes?
  + that's an alternative way to solve the problem
+ Is it better to avoid duck typing or is it a useful tool?
  + useful tool
+ What's the difference between `gets.chomp` and `STDIN.gets.chomp`?
  + `gets.chomp` is secretly `Kernel.gets.chomp` and expects a file name
+ Do we want to always be specific about ^ kind of thing?
  + code hardening = code won't break if someone does something unexpected but we make assumptions about people not doing that. trade off between robustness and getting projects done
+ Why would we write methods that just call methods in other classes?
  + law of demeter. abstract class's methods away
+ What's the `until pos && valid_pos?(pos)` line doing?
  + makes sure there's a position and that it's valid
+ How do we figure out what requires what?
  + diagram showing broad OOP linking concepts. no circular dependencies!
+ Where do you start when you're building a project like this?
  + smallest part. then you can test as you build up

**Recursion**
+ What does the `next` line do in the demo code?
  + prevents us from going out of bounds. it'll skip evaluating the rest of the code in that block
+ Why do we keep calling the recursive step over and over again? It's inefficient
  + yes and we'll see that in a moment
+ Why doesn't ruby cache the result of a function call?
  + ruby doesn't know if the function is a pure function because it could have some side effect so it re-runs everything all the time
+ Why did pulling out the variable make it faster?
  + we're saving the result and re-using it
+ When would we create a cache?
  + if we were running the problem over and over again it could be nice to have everything stored

**Homework**
+ How do you decide what to use as a base case? When do you use `nil`?
  + catch-all for "answer doesn't exist"
+ Why are there two base cases?
  + one is where we want our inductive step to take us and the other keeps us from going out of bounds
+ Is there a good way to avoid your code crashing?
  + you can set your max stack size. ctrl-c
+ Can you use recursion with negative numbers?
  + yes. write two methods or have some conditional in your method
+ Explain gamma function
  + we don't do that much math in the class. it's just `n - 1` factorial, hopefully we're all familiar with factorial


**Quiz**
+ Is "one line should only do one thing" a rule?
  + yes, it's good ruby
+ What if you had a number after key-value pairs in the arguments?
  + ruby won't be able to automatically recognize the k-v pairs as a hash because of the last argument getting in the way
+ When do we give the hash a name?
  + when it hits the function calling it it gets stored in the argument
+ How does it know you're not trying to pass in two hashes in a row?
  + ruby says it's more likely for people to pass in one hash
+ Can't Ruby do a stack call of 50000?
  + maybe. depends on your settings
+ Do recursive functions always have to have an argument?
  + probably yes but maybe it relies on global state
+ Something about multiple classes in a file
  + put them in different files
+ When do we use modules?
  + for more complicated class structures
+ Does `main` count as a stack?
  + maybe
+ `main` isn't produced it's already there
  + yes
+ when do quiz solutions come out
  + the next morning

## 11/16/2016

Lecturer: Ryan Hall

### Questions
- Yesterday's Solutions
  * Is there a way to load all the files into PRY at once? Does `require-relative` reload the dependencies?
  * Didn't understand what the `first_guess` and `second_guess` methods from ComputerPlayer were doing. (Solutions for yesterday's Memory Game)
  * Parallel assignment?
  * What does the _ mean? (placeholder)
  * Is there a difference between `select`, `find`, & `detect`?
  * Difference between `Integer(x)` and `x.to_i`?
  * Can you elaborate on STDIN.gets.chomp vs. gets.chomp?
  * Difference between why do we need to check `pos && valid_pos?(pos)` when we `get_player_input` in memory.rb?
  * We only have a attr_reader on rows, but we're assigning a value in the `[]=` method.
  * Would it hurt my score on an assessment if I use attr_reader and attr_accessor
- Quiz
  * How would you break up the function into more lines? (Q1)
  * Can options hashes accidentally be interpreted as multiple arguments instead of a single hash? (Q2)
  * Can I use a `=>` instead of `:` for a hash? (Q2)
  * Is there a way to increase the max number of stacks before stack overflowing? (Q3)
  * Will an iterative method ever stack overflow? (Q3)
- Homework (no questions!)
- Demo
  * Can we use each_cons?
  * Do we need to add an extra 1 to the end of the row?
  * Will we ever be asked to solve something iteratively/recursively if we know how to do it the other way?

### Mistakes
* Which one is the main stack?

### Notes
* Q1 from the quiz may have some questionable math?
* Typo in homework in add_numbers. Last test case should have an empty array
* General reminders:
  - make the font larger than you think it needs to be
  - reiterate questions that students ask


## 9/14/2016

Lecturer: Claire Rogers

### Questions
* class vs instance methods, and what `self` refers to in each
* `attr_reader`, `attr_accessor`, and `attr_writer` - what they do and keeping as much as possible private

### Mistakes
* confusion over `__FILE__`, `$PROGRAM_NAME`, `ARGV`
* not actually using syntactic sugar methods

### Notes
* Did my same Pascal's Triangle demo I have done the past two times. See demos folder.  


## 7/13/2016

Lecturer: Claire Rogers

### Questions
* How does parallel assignment work?  Do we need to use an array?
* Why don't we need the `@` when referencing `rows`? (there's a private `attr_reader` at the bottom of the file that most of them did not see)
* When do we use the splat operator?
* When do we use public/private/protected methods?
* Why do we overwrite `to_s` and `inspect`
* How many bases do we need?  Is it common to have more than one?

### Mistakes
* General lack of understanding of how syntactic sugar methods work.  Several students had absolutely no idea what was going on.  We spent about 10 min talking about it.  
* When instance variables are necessary.  There was some confusion between sharing values between instance methods and sharing values between classes.
* Not understanding OOP

### Notes
* Have a demo ready for syntactic sugar method
* No one asked about `ARGV` or `gets`/`STDIN.gets`; would be worthwhile to make a point of talking about
* First quiz question not rendering correctly, hence the low scores.  Indentation was indeed incorrect.  
* The questions about yesterday's solutions were very different than the one's I got last cohort when I gave this lecture.  Last time all the questions were related to the previous day's lecture, with students asking about pointers to memory.  Questions this time were much more basic and fundamental.  My theory is that a large portion of the last cohort went through Jumpstart, whereas this cohort has not.  
* **Demo** I have a demo that I have used twice now and I think is good at preparing the students for the day's projects.  See demos folder!
