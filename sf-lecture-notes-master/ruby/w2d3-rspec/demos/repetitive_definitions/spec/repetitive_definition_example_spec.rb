require 'board'

describe Board do
  it "starts with an empty grid" do
    board = Board.new

    expect(board.grid).to eq([[nil, nil], [nil, nil]])
  end

  it "plays a game" do
    board = Board.new
    board.set_pieces

    expect(board.play).to eq("playing")
  end

  it "sets its pieces" do
    board = Board.new
    board.set_pieces

    expect(board.grid).to eq([["pawn", "pawn"], ["rook", "rook"]])
  end

  it "clears its pieces after setting them" do
    board = Board.new
    board.set_pieces
    board.clear_pieces

    expect(board.grid).to eq([[nil, nil], [nil, nil]])
  end

end
