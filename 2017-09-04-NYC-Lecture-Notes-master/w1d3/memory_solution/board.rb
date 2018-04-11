require_relative "card"

class Board
  attr_reader :size

  def initialize(size = 4)
    @rows = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def [](pos)
    row, col = pos
    self.rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    self.rows[row][col] = value
  end

  def hide(pos)
    # This will call the bracked method defined on lines 12--15.
    self[pos].hide
    # This is shorthand for self.[](pos).hide
    # Can we say Board.[](pos)? No, Board is the class. We want the
    # instance.
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
    num_pairs = (size ** 2) / 2
    cards = Card.shuffled_pairs(num_pairs)
    rows.each_index do |i|
      rows[i].each_index do |j|
        self[[i, j]] = cards.pop
      end
    end
  end

  def render
    system("clear")
    puts "  #{(0...size).to_a.join(" ")}"
    rows.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end

  def revealed?(pos)
    #Is this recursion??
    #No, because it's calling revealed? on the card.
    self[pos].revealed?
  end

  def won?
    rows.all? do |row|
      row.all? { |card| card.revealed? }
    end
  end

  private
  attr_reader :rows
end
