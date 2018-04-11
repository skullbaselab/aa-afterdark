require 'board'

describe Board do

  it "starts with a grid of pieces" do
    pieces = double
    board_displayer = double
    player1 = double
    player2 = double

    board = Board.new(pieces, board_displayer, player1, player2)
    expect(board.pieces).to eq(pieces)
  end

end
