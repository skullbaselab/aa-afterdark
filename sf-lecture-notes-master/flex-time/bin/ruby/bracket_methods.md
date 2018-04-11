# Bracket Methods

Important topics to cover:
  * Difference between the instance variable `@grid` and the class `Board` 
    * Could name them whatever you want, `@dog` and `Cat`, whatever helps keep them separate in the student's minds
  * Emphasize that `board[pos]` is equivalent to `board.grid[pos[0], pos[1]]`
    * Passing in a hard-coded position is a little cumbersome: `board[[row, col]]`
    * This is mostly only a concern when testing. In real-world situations, you would pass in a `pos` array directly.

* Keep in mind, `board[pos]` is just syntactic sugar for `board.[](pos)`. We are, at heart, still calling a method.

```rb
class Board

  def initialize
    @grid = Array.new(10) { Array.new(10) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end
```

