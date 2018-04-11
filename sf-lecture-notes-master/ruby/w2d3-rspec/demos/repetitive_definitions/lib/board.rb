class Board
  attr_accessor :grid

  def initialize
    clear_pieces
  end

  def set_pieces
    @grid = [["pawn", "pawn"], ["rook", "rook"]]
  end

  def play
    "playing"
  end

  def clear_pieces
    @grid = [[nil, nil], [nil, nil]]
  end

end
