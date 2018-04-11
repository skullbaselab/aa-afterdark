# Week 2 Day 2


### OOP (Object Oriented Programming)
- Encapsulate
  - grouping things togehter
  - `board.grid[][]` vs `board[pos]`. The former is a violation of Demeter's Law
- Inheritance
  - Ruby had single inheritance. It can only inherit from one other class


  ```ruby
  class Cat
    def meow; end
  end

  class Tiger < Cat
    def meow
      @cat.meow
    end
  end

  tiger = Tiger.new
  tiger.meow
```

```ruby
  class Tiger < Cat
    def initialize(cat)
      @cat = cat
    end

    def meow
      @cat.meow
    end
  end

  class Dog
    def make_noise; end
  end

  tiger = Tiger.new(Dog.new)
  tiger.make_noise
  ```

  - Composition over inheritance: even though it's a part of OOP, inheritance is often a bad design choice.

- Polymorphism


---
- Class is like a blueprint for an instance


## Chess

```ruby
class Piece
  def symbol
    raise NotImplementedError
  end
end
```

- Board
  - on_board?
  - occupied?(pos)
  - piece_at(pos)
  - checkmate?
  - check?
  - deep_dup?
- Piece (color, pos, moved, board)
  - Pawn (weird)
  - SlicingPiece (#moves())
    - Queen
    - Bishop
    - Rook (#move_dirs(), #symbol "R")
  - SteppingPiece
    - King
    - Knight
- Player
  - HumanPlayer
  - AIPlayer
