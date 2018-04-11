class Board
  attr_accessor :pieces

  def initialize(pieces, board_displayer, player1, player2)
    @pieces = pieces
    @board_displayer = board_displayer
    @players = [player1, player2]
  end

end


class Piece
  def initialize(options)
    @color = options[:color]
    @size = options[:size]
  end
end


class BoardDisplayer
  def initialize(options)
    @screen_size = options[:screen_size]
  end
end

class Player
end
