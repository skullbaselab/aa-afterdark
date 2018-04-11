require_relative "card"

class Board
  attr_reader :size

  def initialize(size = 4)
    @rows = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  # pos will be an array with 2 numbers in it's two indices
  # board.[]([0,0]) <--how to literally call this method
  #Ruby allows us to call this method like this: board[pos] (board[[0,0]])
  def [](pos)
    # row = pos[0]
    # col = pos[1]
    #Array decomposition **syntactic sugar**
    row, col = pos

    #calling the @rows method from attr_reader
    # x = rows[row]
    # x[col]
    rows[row][col]
  end

  # board.[]=([0,0], card) <--'official'
  # board[[0,0]] = card <--**syntactic sugar**
  def []=(pos, value) #very similar to the [] method

    row, col = pos
    rows[row][col] = value #access that part of the grid, and reassign the value

    #rows[pos] <-- type conversion error
    #self[pos]= <--RECURSION!
  end

  def hide(pos)
    self[pos].hide
  end

  def reveal(pos)
    if revealed?(pos)
      puts "You can't flip a card that has already been revealed."
    else
      self[pos].reveal
    end
    self[pos].value
  end

  def populate
    num_pairs = (size**2) / 2
    cards = Card.shuffled_pairs(num_pairs)
    rows.each_index do |i|
      rows[i].each_index do |j|
        self[[i, j]] = cards.pop
      end
    end
  end

  def render
    system("clear")
    puts "  #{(0...size).to_a.join(' ')}"
    rows.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def revealed?(pos)
    self[pos].revealed?
  end

  def won?
    rows.all? do |row|
      row.all?(&:revealed?)
    end
  end

  # makes the method only accessible inside the class. We won't use this outside the class
  private

  attr_reader :rows #<-- Helps to prevent typos/errors
end






















#end
