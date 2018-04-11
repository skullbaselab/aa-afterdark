require 'board'

describe Board do

  it "starts with a grid of pieces" do
    pieces = [
      Piece.new(color: "red", size: "Large"),
      Piece.new(color: "red", size: "Large")
    ]

    board_displayer = BoardDisplayer.new(screen_size: "Large")

    player1 = Player.new
    player2 = Player.new

    board = Board.new(pieces, board_displayer, player1, player2)

    expect(board.pieces).to eq(pieces)
  end

end
