## W2D1
### Object Oriented Programming

---

### Roll Call

---

## Questions

---

## OOP - Principles

+ Encapsulation
+ Inheritance
+ Polymorphism

---

## Encapsulation

+ packaging data and methods into a single component (classes)
+ objects provide interface to interact with (private/public)
+ internal state is hidden, allowing refactoring
+ strive for modularity - swap it out with another

---

## Inheritance - `<`

+ sub classes 'inherit' all behavior from parent class
+ can add methods to sub-class without changing parent
+ methods defined on subclass 'override' parent
+ call original method using `super`
+ useful for eliminating duplication

---

## Polymorphism

+ different objects responding to the same messages (method calls)
+ can use different types interchangeably, can be agnostic of type
+ ruby has 'duck typing', doesn't check type, just sends message
+ imagine a car and driver, driver could be android, car wouldn't know

---

## Monkey Patching

+ syntax just like re-defining a class
+ define a method that already exists or define new method
+ now `[1,2,3].each` prints a stupid message

```Ruby
class Array
  def each
    puts "this method isn't useful, but whatever"
  end
end
```

---

## Exceptions

+ when exceptional state occurs, stop execution
+ will kill entire program if not _rescued_
+ `begin`, `rescue`, `ensure`, and `retry`
+ can `rescue` certain exceptions or all
+ can have multiple rescues to capture different kinds of exceptions
+ ensure ALWAYS runs wether an exception occurred or not
+ `fail` to manually raise exceptions (also `raise`)

---

## OOP - Strategy
+ *nouns* are the objects (classes)
+ classes do one thing, one thing only
+ classes shouldn't be closely coupled,
  changing one class shouldn't necessitate changing another
+ no god classes, keep an eye on creeping of size/breadth
+ it's hard, try and stick to principles and refactor constantly

---

## Chess

+ nouns? verbs?

---

## Chess - Main Classes

+ `Game`
+ `Player`
+ `Board`
+ `Piece`
+ `SteppingPiece`
+ `SlidingPiece`
+ `Pawn` - uncommon movement rules
+ individual piece classes

---

## Board - some methods you might need

+ `@grid`
+ `#[](pos)`
+ `#on_board?(pos)`
+ `#occupied?(pos)`
+ `#checkmate?(color)`
+ `#check?(color)`
+ `#dup` - deeply duplicate board (for check)

---

## Piece

+ `@color`
+ `@pos`
+ `@board`

---

## SlidingPiece / SteppingPiece
+ `#moves`

---

## Individual Piece Classes
+ `#symbol`
+ `#move_diffs` if SteppingPiece
+ `#move_dirs` if SlidingPiece
+ `#moves` if Pawn

---

## Approach

0. Board
0. Pieces moving
0. Pawn (simple Game class)
0. in_check?(color)
0. update piece to have valid_moves = moves - moves_into_check (HINT:
dup board)
0. check_mate?(color)

---

## End
