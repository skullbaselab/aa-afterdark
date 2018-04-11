# W1D2 Lecture

# December 5, 2017

Lecturer: Ned Ruggeri
Scribe: Kelly Chung

### Lecture Questions

1. Is shovel the same as push?
  + Yes - they are the same
1. Are there different situations where you'd want to use push over `<<`?
  + Nope
1. Are people going to hate you if I use push exclusively over `<<`?
  + Yes
1. If we didn't have * in front of the array, would it nest the array?
  + Absolutely
1. Are references somehow helpful, or is it something we just live with?
  + Fundamental to how Ruby works
1. Can you throw the splat operator in front of an array stored in a
variable?
  + Yes. It's called destructuring assignment
1. Is splat a method?
  + No, it's more an element of Ruby syntax
1. Do we ever want to pass an array as the second value of Array.new?
  + Nope - can't think of a good use case
1. What happens if instead of pushing, I use the += method?
  + It would reassign the reference to a different point in memory.
1. Is `[]` the same as `Array.new`?
  + Yes
1. Will it run the bloc for every slot in the constructed array?
  + Yes
1. How do we created Array defaults in Hash defaults?
  + Demos
1. Is there a difference between lambdas and procs?
  + `return` scope
1. Blocks are not supposed to be objects?
  + Procs are object-ified blocks, and can be stored in a variable
1. You can't have more than one proc brought in?
  + More specifically, you can't pass more than 1 block per method
1. If you have multiple arguments, the procified argument should be the
last one?
  + Yes
1. Would it be poorstyle to use elsif or else if necessary?
  + No

+ 10/03/17
+ Lecturer: Kelly
+ Notes: Andres

#### Questions
  + Is the table of mutable/immutable exhaustive?
   + No, it is not, its just a table of the most common Ruby Objects.
  + Is the value of variables stored in random place in memory? (Deferred to open forum).
  + If I change index 0 of an array, will the cell for value 0 change?
  + What happen in memory if we shift an array?
    + Ring buffer deferred question.
  + What happens if 2 variables point to an array and the array is relocated due to memory constrains ?
   + Ruby handles that internally, implementation of the language itself.
  + Is concat and += the same operation.
   + It is not.
  + *alias* question deferred to open forum.
  + Appropriate usage of **concat** and **+=** .
   + As a Rubyist you choose which better suits what you are trying to achieve, Ruby gives you different ways of doing the same thing.
  + Array.new(3,0) #=> [0,0,0], if we update the first 0 will the rest of the values be updated too.
   + No, Fixnum are not mutable, and the only way to update them by is re-assigning it.
  + How to pass multiple blocks?
   + We cant, but if required we can proc-ify the blocks and pass them as args.
  + How to turn procs into blocks.
    + Use **&** inside the body of functions to bloc-ify a proc and send it as argument.


#### Notes to Kelly
  + Great idea to start from scratch when comparing **.concat** and **+=**, that clarified a lot of questions.
  + Great explanation on the rule of thumb of when an actual variable reassigns its value, when there is a **__=__**.
  + Deferred internals of how ruby works to open forum, there were a couple of such questions.
  + Great job explaining the difference of *__splat__* and *__&__* being used in method definition and method body.
  + There were a few code examples where the code was hard to see for the last row students as the code was on the bottom lines of the editor.



---------

+ 5/30/2017
+ Lecturer: Kelly
+ Notes: Dallas

## Questions

## Project Questions

* Where we supposed to be able to chain my_each with with_index?
  * No. They could write my_each to include an index, however.
* Is there a preference between using yield and prc.call?
  * Yes. prc.call for readability.
* What is the underscore in methods and method calls?
  * Placeholder for an unused argument.
* Is there a way to skip the print function?
  * This is a specific characteristic of pry
* Why do we default to attr_reader instead of attr_writer/attr_accessor
  * Try to prevent objects from being accidentally reassigned. Does not prevent mutation...
* When do we use the @ symbol vs just calling the instance variable by name?
  * When attr_reader is used, we assume that an instance variable will exist somewhere in    my class.
  * We should set instance variables in the initialize function (convention).
* Does setting something as private change the readability/writeability of variables?
  * Private is more for controlling exposure to internal methods.
* What do we use attr_writer/attr_reader for?
  * It allows access to those variables from the outside.
* Why do we use a set vs an array?
  * Constant lookup time for strings.
* Why do we use a constant vs an instance variable?
  * The constant is not specific to any particular instance of a class. It doesn't make sense to creat a new version for every instance.
  * There are cases when we could use class methods for the same reasoning.

## Lecture
* What happens when you do `y = x.dup`? (x = [])
  * Shallow duplicate vs. deep duplicate.
* What is the difference between `<<` and `concat`?
* Difference between `+=` and `<<`?
  * `+=` creates a new reference.
* Blocks and Procs?
  * Block is code, Proc is an argument
* What do we do to optionally take in a block?
  * Set a default value.
  * Pair with a lazy assignment ||=
* Are there any false value than `nil` and `false`
* If you pass in a block without the `&`, does it still work?
  * No. Argument error.
* []()??
  * Syntactic Sugar and Ruby Magic!!
* `a,b,c = [1,2]`
* `a # => 1`
* `b # => 2`
* `c # => nil`

## Notes For Kelly
* Might have been clearer to show the variable slide before the pointer example. (The question forced your hand).
* Good job on steering the questions. There were a lot....


---------

+ 3/28/2017
+ Lecturer: Jenn
+ Notes: Luke

## Questions

## Project Questions

* Is it OK to use return to halt iteration
  * It depends
* Is concat a reference thing? (the scribe is not quite sure what this means)
  * Yes
* Same for << and +=
  * Yes for <<, no for +=
* How does modulo work?
  * Think of a clock.
* Explain find.
  * Explains.
* What does find work for?
  * Arrays and hashes and things you can iterate through
* Are sets faster than hashes?
  * They're the same.
* Why arg instead of yield?
  * Style
* Taking a proc vs a block?
  * We often turn a block into a proc using &.
* What if we don't pass a block?
  * Use nil as a default arg.
* How does readlines work?
  * It reads the lines into an array


## Assessment 0 Questions

* We don't have the solutions yet
  * They're online


## Quiz Solution

* Why is x 7, not 10
  * Scope: the x inside the function is not the x outside the function
* So, we can store different variables with the same name?
  * Yes, in different scopes.
* What if x was a symbol?
  * That doesn't make sense.
* How does memory know which x we want?
  * SCOPE!!!!
* So we can change mutable things but not immmutable ones?
  * Yes
* Shovel vs +=
  * The first mutates, the second returns a new array
* Can you do a similar thing with a fixnum
  * NO!
* Can you check if something is mutable?
  * Probably
* What does tightly coupled mean?
  * We need to know to many things.
* Why is unless better than if not?
  * Ruby should read like English


## Lecture Questions

* Are classes we make mutable?
  * Yes, but you control the API
* Can we make them immutable?
  * No, but you can leave out setters.
* Can we make Fixnums mutable
  * No
* What about freezing?
  * Meh?
* A long question about pointers?
  * Exactly right!


## Demo Questions

* Why is Array.new(4, []) the default behavior.
  * Think of it as an option.
* What if we reasign the first element rather than mutating?
  * The remaining three are left alone.
* Why multiple brackets?
  * Cause method with brackets takes array in brackets
* Could we call bracket methods like a regular methods?
  * Yes
* Must bracket methods be called with one param and bracket-equals with two?
  * No, but that's the right idea
* row, col = pos, could you have more vars?
  * Yes!


## Style

* Does it matter how you name your file?
  * Usually lower snake case version of the name of the class it contains.
* What happens if we ignore style rules?
  * You will confuse people, but ruby won't break.

+ 1/24/2017
+ Lecturer: Shamayel
+ Notes: Gage

## Questions

+ ?? # old variables get garbage collected quickly, so it's not a problem
+ if i store self in another variable and then alter it, why does self get
altered? # both variables point to the same array -> in-depth explanation of
that happening in ruby
+ `concat` vs. adding arrays? # we'll go into that more later
+ `clone` vs. `dup`? # haven't ever used `clone`; look at the docs

**Ghost**

+ the instructions recommend that we store our dictionary in a `set`, but we
didn't notice any performance differences - why do that? # sets combine
characteristics of arrays and hashes; `include?` is O(1) in sets
  + how do we use `set`? # require it to use it
  + what does a set look like? # an array but with curly braces
  + if you printed it, would it still be ordered? # i believe so; it will be
  pseudo-ordered
+ ?? something about organization? # very important to organize our code by
splitting it up into multiple files
+ can you define a set literal using `{1, 2, 3}` syntax? # i'm not sure
+ when do we put something into a new file? # each class gets its own file
+ all-capitalized variables vs. regular variables? # CONSTANTS

... missed a few...

+ require vs. require_relative? # require looks at your ruby installation
directory; require_relative looks at the current directory
+ why make the dictionary in initialize as opposed to another method? #
personal choice
+ what is the `_` doing? # represents a variable that we don't care about
  + what about a variable starting with an underscore? # it's a readability
  thing for other people looking at your code
+ is require_relative relative to the file? # yes
+ does it also search subfolders? # no, you have to specify the path
+ `__FILE__ == $PROGRAM_NAME`? # only runs if you run the file using `ruby
ghost.rb`


**attr_reader/writer**

+ if you can to access cats in the same class but don't want to type the `@`,
you have to set up an attr_reader? # use `@` in general; encapsulation is good
+ can you put the reader under `private`? # yes, but it's weird
+ ?? # you can do `@=` inside the class itself
+ is the `=` necessary for `def cats=(val)`? # yes, it's the name of the method
  + ?? # yes, exactly
  + so the `=` isn't an assignment operator, it's just part of the method name? # yes
  + but you can put a space between `cats` and `=` when you're calling it? #
  yes, ruby is smart
  + what about `+`? # you have to define a `+` method
  + so we'd define `cats+`? # just define `+`
  + what if you are monkeypatching String? # String already has `+` defined
+ how do we decide when to make attr_accessors? # add them as you need them
+ i think it's helpful to have instance variables listed at the top? # write a
comment for yourself?

**Assessment**

+ why not use `to_s` for `digital_root`? # the question is about manipulating
numbers, not turning the number into a string
+ ?? test-taking strategies? # do the practice assessment over and over again
+ aren't we mutating `num` in `digital_root`? # you can't mutate numbers
+ sort with a block? # is there a sort with a block? talk to me after lecture
+ ?? # the assessments all have different formats
+ are there any assessments where we have to make game? # yes
+ ?? # we release them on specific days; it will be announced

**Quiz**

+ should we use pry and try to solve the problems? # sure, why not

+ we won't ever get immediate feedback about whether our answers are correct? #
no

+ Q2 - we're changing it once or three times? # once; it's getting displayed
three times

+ Q4 - ?? # ruby is pass-by-reference, i believe
  + when you set `a = x`, are you changing the reference, or making a new
  reference? # object_id of `7` is fixed
  + so `x=7` and `y=7`, will those have the same object_id? # yes; let's test it
  + if we were using an array instead of a FixNum, what would happen? # arrays
  are different from numbers in that they can be mutated
  + what if we created a new array? # assigned to a new place in memory
  + ?? # correct - mutating changes the value stored in memory, reassigning
  creates a new place in memory
  + wouldn't it be clearer if the argument had a new name? # yes, but the point
  is that it's something you have to think about
  + are all numbers immutable? # BigNums vs. FixNums? BigNums might be mutable?
  + you can compare strings using `==` even if they're different objects? # also true for arrays and hashes - it looks at the contents of the objects
  + `===` vs. `==`? # not a ruby thing

+ Q5 - `+=` would be difference? # yes

+ Q6 - ?? # game.board[pos] indicates tight coupling
  + ?? # lots of assumptions in order for code to work
  + ?? # hard to answer - one `&&` is usually fine
  + ?? law of demeter? # only talk to your neighbors

  + ?? # `== false` means we could flip everything else

**References**

+ can you concat a `4` onto an array? # no, concat is like `+=`
+ ?? shovel? # pretty much - you have to think about the data type
+ if you shovel an array into an array, don't you get a multi-dimensional
array? # yes
+ is there any benefits of that? why would we ever use concat? # concat != +=
+ is there a version of push that doesn't modify? # no
+ ?? # essentially, yeah, it puts the content into the other array
+ is it equivalent to putting each element into the other array? # probably;
look at the source code
+ concat vs push? # it depends on how you want to structure your arrays
+ is it helpful to look at how these ruby methods are written? # you probably
won't have time to

+ what if you wanted to add something to everything at once in the hash # you
probably wouldn't want to do that
+ ?? # exactly; we never set a reference to it and it got garbage collected
+ but if we set `a[0] = a[0]` then the value gets initialized? # let's check ->
yes
+ if we pass ?? instead of the block? # you can pass in a block like `{|h, k|
h[k] = []}`
+ ?? # `Array.new` is the same as `[]`
+ don't we need the name to match the name of our hash? # our hash gets passed
in as the first variable; we typically call it `h`
+ nil errors? # talk to me after lecture
+ if `h[k]` ?? # `v` isn't defined in that scope
+ ?? # let's find out -> if we try several different ways of initializing a
string we can see that we're getting a new string object each time

**Code Style**

+ if you have a variable for player 1, how would you write that? # `player_one`
+ true / false vs. truthy and falsy? # `true` & `false` are the only things that
are true and false; false and nil are falsy, and everything else is truthy
+ long single line vs. short multiple lines? # rewrite the line; use helper
methods
+ ?? # you can break up long lines into multiline statements, including
multiline strings
+ is `"hi".split.map.join.upcase` violating the law of demeter? # it's calling
multiple methods on one object and some return values rather than accessing
attributes of other objects
+ `a = string.split.join` vs. `a = string.split; a.join`? the former
+ 72 character lines or 80? # usually 80; ruby might be 72
+ ?? # save the strings as variables
+ ternary operators? # helper methods
+ adding strings vs. interpolation # if you are looping through an array, you
can add those strings
+ `<<` vs. interpolation? # `<<` puts the new value at the end of the string
+ ?? # yield is only for blocks that we're not actually passing in as arguments
  + so would that example work if you changed `prc.call` to `yield`? # let's see
  -> it would still work
  + `&prc` vs. `&blk`? # just a variable name
  + passing block/proc to a helper method? # you need to turn the block into an
  object in order to pass it to a function
    + do you use the ampersand when passing it or not? # let's see -> you have
    to turn it into a block to pass it to another function
    + what if you remove all the ampersands? # then the proc is an object
    stored in memory and we can pass it as an argument
    + are you just writing what the `&` operator does? # not really; we're
    leaving the proc as an object
  + what if we try `prc.class`? # `Proc`
  + what if we try `&prc.class`? # ERROR NO METHOD
+ can we pass more than one proc? # yes, as proc objects
+ default value for block vs. block_given? # prefer default value
+ default value - we won't get an argumenterror? # you might have to set a
default value for the block

+ can you splat a block? # ?? -> the colors seem wrong in atom

+ can we write messy code on assessments? # it's okay, but in general, refactor
your code and it'll be easier to get it to work

## Notes

Very quiet questions - make sure to repeat the question!

I think the demos of `concat` vs. `+=` might have been helpful to preempt some
of the questions in the References section

truthy / falsy - mention `!` and `!!`?

---

## 11/15/16

Lecturer: Claire Rogers

### Questions
#### From previous day
* In my_each, why self[i], not self[i-1]?
* my_rotate: what are drop and take?
* What does sleep(2) do?
* Why the round_over? Method? It's only one line.
* What does next do in a loop?
* First line of display_standings, what does it do? why? how?
* Does underscore as an argument function as a variable?
* How are sets different from other data structures?
* Enumerable methods for sets?
* What does attr_reader do? Why no parens? What about attr_writer? Do you still have to initialize the instance variable?
* Why can we shovel into something coming from a reader?
* How would we write a getter without syntactic sugar?
* Do instance variables need the @ symbol?
* Why not just use attr_accessor?
* getters? method or variable?
* public/private/protected methods? What order should they come in?

#### From Assessment00
* Digital root? What does it want you to do?
* How much math do we need to know?
* More efficient way to do real_words_in_string?
* Are there other ways to do the projects that are different from the solutions?

#### From Quiz
* Question 3, why doesn't it mutate change x?
* What about global variables?
* Does foo persist?
* Name collisions between variables of different scope?
* What about += in question 4?
* Should we ever use unless else?
* Question 6, what does tight coupling mean?

#### From Lecture
* Is there an array out of bounds error in ruby?
* Can we change what a key in a hash points to? What about pointing through another hash?
* Empty parens after hash.new? Do we need them?

### Mistakes
* Default values for hashes
* Not knowing the difference between `attr_reader`, `attr_writer`, `attr_accessor`

### Notes
* Lots of questions about a00 - students were stressed!
* Students were very confused about default values in hashes.  We spent ~20min on this one.
* Lots of confusion about public, private, protected methods
* Previous day's project uses a set, students wanted to know what a set is.  Be prepared to explain this.
* For future lecturers, I would recommend starting of with some sort of acknowledgement that it is day 2, students are stressed, they're all doing great, deserve to be here.  I think they really could have used a pep talk.


## 9/13/16

Lecturer: Ryan Hall

### Questions
  * concat vs `push(*[])` vs << vs +=
  * yield vs proc.call
  * `__FILE__ == $PROGRAM_NAME`
  * require versus require_relative
  * "tightly coupled” mean?
  * what does bundle exec do?
  * what does the ampersand do?
