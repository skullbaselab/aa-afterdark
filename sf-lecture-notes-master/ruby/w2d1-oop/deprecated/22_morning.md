# OOP

+ Encapsulation
+ Inheritance
+ Polymorphism

---

## Encapsulation

Grouping of related ideas into one unit that can be refered to by the
same name later

+ Information / implementation hiding
 - Restrict visibility of certain decisions
 - think minesweeper `board.grid[][]` vs. `board[pos]`

+ State retention
 - An object is aware of its past

---

+ Messages
 - sometimes refered to as invoking or calling a method
 - the way for obj1 to demand obj2 to apply one of its methods
 - created by message name and arguments (signature)
 - types of message
   + informative (setters)
   + interrogative (getters)
   + imperative (actions)

+ Classes
 - stencil from which objects are created (instantiated) 
 - a class is what you design and program, objects are what you create
   from a 
class at runtime

---

## Inheritance

Objects can use methods and variables that would otherwise only be
available in some other class.

---

## Polymorphism
 - duck typing (ability for a method name to be defined on more than one
   object and take on many meanings)
 - variable can point to objects of different types during run time
 - Demo: `human_player`

---

# Content

---

Know how to extend a class.
Know how to override a method.
Know how to call the original method.


---

# Chess

```
class Piece
  def symbol
    raise NotImplementedError.new
  end
end
```
+ Board
  + on_board?
  + occupied?(pos)
  + piece_at(pos)
  + checkmate?
  + check?
  + `#deep_dup`
+ Piece
    + @color
    + @pos
    + @moved
    + @board
    + #valid_moves()
 + Pawn (weird)
 + SlidingPiece
   + #moves()
   + Rook
     + #move_dirs()
     + #symbol "R"
   + Bishop
   + Queen
 + SteppingPiece
   + #move_diffs()
   + King
   + Knight

+ Player
+ Game











---

## `Piece`
+ pos
+ board
+ color
+ moves()

## `SlidingPiece`
+ move_dirs()
## `SteppingPiece`
+ move_diffs()

---

## Approach

0. Board
0. Piece moving
0. Pawn (simple Game class)
0. in_check?(color)
0. update piece to have valid_moves = moves - moves_into_check (HINT:
dup board)
0. check_mate?(color)

---

# Demos

```rb
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable # mixing in Swimmable module
end
```

```rb
class Boat
  init(length, crew)
  drive(speed = 3)
    speed.times { print "paddle " }

class PirateShip
  init(length, crew, sails)
  drive
    if sails
      speed.times { print "wind " }
      puts " in the sails"
    else
      super(8)
```
