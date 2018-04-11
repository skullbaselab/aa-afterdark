# Lecture Prep Doc

## Topics Covered in Readings/Materials

+ References
+ Array/Hash Defaults
+ Scope
+ Refactoring and Code Smells
+ HTML/CSS non-tech
+ Intro to HTML

## Topics Covered in Homeworks

No homework

## Topics Covered in Today's Projects

+ HTML
  + `head`, `body`, `section`s, `h1`, `h2`
+ Memory Puzzles
  + Creating classes
  + `require_relative`
  + `[]` and `[]=` methods
  + Using pry to test code
  + Initialize Array with default values
  + Ducktyping the `Player`
+ Sudoku
  + Creating classes
  + Factory methods

## Preparing For Lecture

### Background

+ [Ruby is strictly pass by value](https://stackoverflow.com/questions/22827566/ruby-parameters-by-reference-or-by-value/22827949#22827949)

### Lecture Notes

Most of the things covered in this lecture are second nature for us by this
point. It is important to know the knowledge students have about references/
pointers. Right now, we expect that they:

+ Have encountered problems with `<<` and `concat` changing their arrays in
undesired ways
+ Do _not_ understand the difference between assignment and mutation
+ Do not understand pass by value or reference
+ Some have learned that arrays are referenced by pointers

Using `pass by value or reference` can be confusing to students and it's not
really something they need to learn right now. We only need to describe how
Ruby implements these things.

The way I like to describe it: In Ruby, everything is an object. But based on
the methods defined on each class determines whether we are allowed to change
the contents of that object. Classess like FixNum don't, so if we want a
variable holding a FixNum to change value, we _have_ to reassign it to a new
FixNum. Array and String, on the other hand, allows us to mutate/change the
internal contents of the array object. This best described to them through
code demos.

### Coding Demos

In coding demos:

+ Make good use of the `.object_id` method to show that certain things either
are or are not the same object
+ Always make sure to actually mutate the object(s) so students can see a
concrete example of what's happening.



