# Notes

##Chess Solution notes

**Expect questions on:**
+ move_piece vs move_piece!
  + Good moment to show byebug's `where`, which will elucidate the cycle
  + board.move --> piece.valid_moves --> piece.move_into_check? --> board.move
+ `next false` in `Pawn#side attacks`. Cool syntax to return `false` directly to the block in that iteration.
+ `@notifications` in Display class. Nice to handle all display things in the Display class. All errors get bubbles up to Game class, which sets errors in its Display.

**Point out:**
+ Organization of 'pieces.rb', requires all the 'piece' files
+ NullPiece vs using nil. Memory advantages AND we get to define methods on NullPiece
so that they act like pieces

# Chess Strategies

---
## Overview

- Goal is to write Board#in_check? and Board#checkmate?
- Not the only way to do this


---
### Board#in_check?(color)

- Find the king's position
- See if any opposing pieces have moves to that position

---
### Board#checkmate?(color)

- Board#in_check?
- Piece#valid_moves
  - Piece#moves
  - Piece#move_into_check?
    - Board#dup
    - Board#move!
    - Board#in_check?

---
### Piece#valid_moves

- Piece should have a method #moves that returns all possible moves
- Piece#valid_moves should filter out the moves that leave the piece's color in
check, using Board#move_into_check?


---
### Board#move_into_check?

- Create a copy of the current board using Board#dup
- Make the requested move using #move!
- Check for Board#in_check?


---

### Board#dup
- Make a copy of the board and it's pieces, move a piece and see if the board is
in check
- Prevent board from doing setup
- Pieces might need a reference to the new board


---
### Board#move(start_pos, end_pos)

- Checks if move is valid
- Can the piece at start_pos move to end_pos?
- If valid, it will make the move

---

### Board#move!(start_pos, end_pos)
- Moves a piece without validating
- Used directly in Piece#valid_moves

## Testing Notes

* When we’re writing code, whether it be a tiny method or a large web app, we are probably (or at least should be) testing it as we go to make sure that our code actually works.
* Why do we test?
  * Make sure our app works - it would be silly to ship something without ever checking if it works
  * Increase flexibility and reduce fear of code breaking - makes it easy to refactor. If anything breaks, we will know it.
  * Makes collaboration easier - people can make sure their work doesn’t break other people’s code
  * It’s a form of documentation - well written, descriptive tests tell others what your code is doing
* Manual testing
  * Often, especially when working with small codebases, testing is something that we do manually - either by testing out in Pry to check what our method returns with various inputs, using print statements, or by using debugger
  * This allows us to check that our code is working properly and is pretty easy to get set up.
  * The downside is that manual testing can be pretty tedious, and worse, can be vulnerable to false positives and false negatives. We can’t always trust manual testing, and it can really be a pain.
  * Check for knowledge of byebug & pry
 * For example, in pry, every time we change a class, we need to reload the file and then reinitialize the instances we are testing. This can get really annoying, really fast, especially as our apps get more complicated
* Enter automated testing
* TDD
  * Test Driven Development
  * True TDD rare - assumes you know exactly what you want (Pivotal Labs, Square, Braintree)
  * Most companies in industry do write lots of tests, however, so it a very important skill to know and know well.
  * More common is an “agile” approach - breaking things down into tiny features, writing some code for that feature, then moving forward with the tests for that feature.
  * We’ll be learning the basics of RSpec, which is a Ruby domain-specific language made for testing. It has it’s own syntax, methods, and patterns, but in the end, it’s just Ruby code.
* Rspec!
  * A DSL is a language dedicated to a specific problem domain, like testing. Abstracts away lots of the syntax we’d need to use for testing.
    * Other testing frameworks for Ruby - cucumber, test/unit
    * We like Rspec because it is semantically very similar to English
    * Cucumber - specifications (features) separate from code. Good for developing apps for clients who want to write specs. (.features) file.
* How do we get access to rspec?
  * Show how to add rspec and byebug gems
  + `rspec --init` creates `.rspec` file and `spec` folder.
    + Command-line flags like 'color' and 'format documentation' can go in .rspec file
    + Gauge comfort level with HW syntax. If they're fine, you can tell them about rspec --init, but work from a skeleton with pending specs instead of a newly initialized rspec directory
* Before we get started with syntax, what do we even test?
  * We are going to be doing unit testing today - we want to see how each class works alone. This is the foundation for strong tests. Integration testing, seeing how the whole app works together, is a little bit different.
  * Don’t test implementation details too much - don’t test any private methods. Just test public API (we consider private methods implementation details)
* Talk about directory structure
* Talk about basic syntax
* Describe, context, it
* Describe things well - let rspec be your documentation. People should be able to read through your rspec code like English and figure out exactly what your code does.
* Core vs. Expectations
  * Core has actual rspec functionality
  * Expectations has matchers like includes, etc.
* Talk about gotchas
  * Error raising
  * Eq vs. Be (be checks object hash identity)
* Harder things
  * Shared examples
  * Metadata
  * Subject/ Let
* How do we make our specs dry?
  * Use a let or subject block so you don’t have to do setup 80 million times
  * Does not persist state.
  * let!(:cat) what does let! Do?
* `It` lives in a `describe` block
* before(:each) vs before(:all)
* Which one?
  * Let is faster - it only springs the variable into existence if you call upon them in a given spec
* Should vs. Expect
* Should extends the object class which is bad practice, so it is deprecated

Under the Hood
http://interblah.net/how-rspec-works
Rspec module including “describe” extends self at the top level of the ruby interpreter, extending the main singleton
“Describe” initializes RSpec::Code::ExampleGroup
This instance of ExampleGroup then has set_it_up method called on it which gives it metadata on line number & file
Module eval - can add methods to class. Evaluates string or block in the context of
Eigenclasses http://www.integralist.co.uk/posts/eigenclass.html
An eigenclass is a singleton. It returns an anonymous class that inherits from the parent class. Its goal is to add methods to that instance alone, not the entire class.
Rspec is still defined in an OO style
Each describe group creates a subclass - instances of this subclass are stored in the parent’s children array


**Add a section to the demo using mocks next time!**
