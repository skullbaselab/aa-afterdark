require 'board'

describe Board do
  let(:board) { Board.new }

  it "starts with an empty grid" do
    expect(board.grid).to eq([[nil, nil], [nil, nil]])
  end

  it "plays a game" do
    board.set_pieces

    expect(board.play).to eq("playing")
  end

  it "sets its pieces" do
    board.set_pieces

    expect(board.grid).to eq([["pawn", "pawn"], ["rook", "rook"]])
  end

  it "clears its pieces after setting them" do
    board.set_pieces
    board.clear_pieces

    expect(board.grid).to eq([[nil, nil], [nil, nil]])
  end

end
