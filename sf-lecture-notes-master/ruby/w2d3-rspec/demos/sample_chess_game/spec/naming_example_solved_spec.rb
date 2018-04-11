require 'board'

describe Board do

  before(:each) do
    @board = Board.new
  end
  it "initializes" do
    board = Board.new
  end

  it "has an empty grid" do
    board = Board.new

    expect(board.grid).to be([[nil, nil], [nil, nil]])
  end

  it "plays a game" do
    board = Board.new

    expect(board.play).to be("playing")
  end

  it "sets its pieces" do
    board = Board.new

    board.set_pieces
    expect(board.grid).to be([["pawn", "pawn"], ["rook", "rook"]])
  end


end
