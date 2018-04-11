# Week 2 Day 4

- private method: can't be accessed outside the class
- protected method: only instance methods can call on each other

```ruby
class Snowman
  attr_reader :name

  def initialize name
    @name = name
  end

  def sunshine
    self.melt
  end

  def say_hi(other)
    puts other.nose_length
  end

  protected

    def nose_length
      2
    end

  private

    def melt
      put "I'm melting..."
    end

end

olaf = Snowman.new("Olaf")
frosty = Snowman.new("Frosty")

olaf.melt
#=> NoMethodError: private method `melt' called for ...

olaf.sunshine
#=> NoMethodError: private method `sunshine' called for ...
frosty.say_hi(olaf)
#=> 2

frosty.nose_length
#=> NoMethodError: protected method `nose_length' called for ...
```


### Checkers

- Piece (>King?)
  - king?
- Board
  - `[ ]`, `[ ]=`
- Game
- Player
