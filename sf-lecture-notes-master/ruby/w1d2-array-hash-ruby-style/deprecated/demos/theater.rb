require 'byebug'

class Theater
  def initialize
    @seats = Array.new(3){Array.new(3){""}}
  end

  def [](pos)
    row, col = pos
    @seats[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @seats[row][col] = value
  end

  attr_reader :seats
end

# theater = Theater.new 
# my_seat = [0,0]
# theater[my_seat] = "jenn's seat"
#
# better than theater.seats[my_seat[0], my_seat[1]]
# theater[my_seat] == theater[[0, 0]]
#
