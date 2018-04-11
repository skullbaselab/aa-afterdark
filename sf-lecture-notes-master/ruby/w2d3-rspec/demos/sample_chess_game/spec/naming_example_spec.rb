require 'board'

describe Board do

  let(:board) { Board.new }

  it "should have an empty grid" do
    expect(board.grid).to be([[nil, nil], [nil, nil]])
  end

  it "should play a game" do
    expect(board.play).to be("playing")
  end

  it "should set its pieces" do
    expect(board.grid).to be([["pawn", "pawn"], ["rook", "rook"]])
  end

end
