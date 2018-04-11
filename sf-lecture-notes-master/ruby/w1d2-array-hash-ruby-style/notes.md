# w1d2

## Solutions prep

**Expect questions on:**
+ Everything. If it relates to material covered later in lecture (procs, attr_readers, etc), OK to defer questions to later.
+ `#times` -- what does it pass to block? Show with a debugger.
+ `next` in `bubble_sort`
+ `inspect` vs `to_s`. `inspect` is for debugging (p, return values in pry), `to_s` is for user interaction in terminal. You have to return a string from these methods, otherwise they won't work properly.
+ losses.count { |_, v| v < MAX_LOSS_COUNT }
  - Underscore is for reader to know that the variable won't be important or used within the block.
+ Private/public. Good preview for next week. As few methods as possible are public
+ Set.new
  - For now, just say Sets and Hashes are very efficient lookup (no iteration) and we'll learn lots later

**Point out:**
+ Awesomeness of `my_rotate` with modulo and `#take` and `#drop`. Go ruby!
+ Benefits of `if __FILE__ == $PROGRAM_NAME`
+ Use of `#inspect` for better return values when debugging and `#to_s` to specify value for `puts`


## Pass by reference
* everything is pass by reference!
* from C/C++ etc, can pass by value (a copy) or by ref using `&`
* imagine giving someone a web address as opposed to a printout of page
* one is a copy that you can edit, other is just a pointer to original
* if an object is mutable and passed as an arg, you can mutate the original
* `=` operator assigns a new variable
* `[]=` is accesses one of the buckets in an array or hash and assigns that
* `+=` `-=`
* `||` short circuits, `||=` to assign a value if necessary

## Scope
* context in which a variable can be referenced
* in scope if defined within the same method
* can't use vars before definition
* can't use vars from deeper scope or shallower
* blocks can access vars from where they are created, but vars created inside aren't exported

## Refactoring (code smells)
* code that works but has indications of coming problems
* when we refactor we make our code organized and clean
* Duplicated/similar code - make one method and call from both places
* Long methods - separate, a method should do one thing
* Too many parameters - too complex of a method, coupled to implementation
* Data clump - same things passed together? Make them an object.
* Long method chains - want to hide implementation, make methods that hide internals
* Indecent Exposure - too many methods exposed: want bare minimum interface

## Array/Hash Defaults
* array is a box of pointers and can be mutated
* Array.new(4, []) makes 4 of the same array, Array.new(4) { [] } instead
* mutable means that it can be changed and still be same object
* Hash.new([]) sets the same array as the default for any unassigned key
* it can therefore be mutated, so Hash.new() {[]} would solve problem

## Procs and Blocks
* `&` procifies a block if it is used in a method definition. `&` blockifies a proc if it is used in a method call.
* Have brief demo prepared to show this 

## Code Style
* DRY - don't repeat yourself: if you copy, extract a method and use it in both
* DRY DRY DRY
* Style is essential, follow the style guide! Just like writing english, people
  will think you don't know what you are doing just on appearance
* While giving interviews, it is a dead giveaway that someone lacks experience.
* Indentation
* Short lines
* Deep nesting (use more methods to fix)
* Line breaks for paragraphs
* Blocks on more than one line: `do` `end`, otherwise `{}`
* Interpolate
* Simple methods, few lines, but not MEGA lines,
  impossible to debug, NOT IMPRESSED
* Good ruby code, using it's many methods, should read like english
* Don't modify arguments, unless `method!` is clear that it does that
* Use good variable names, good method names, no temp, `i` is OK
* good method names describe what it does or returns
* snake case, screaming snake, and camel in ruby
* one way to do things

## Git
* git init
* git add .
* git commit -m
* git status

## Demo
* show the [video](https://www.youtube.com/watch?v=8ZMOWypU34k)
* answer questions about readings/solutions/assessments
* talk about pass by reference
