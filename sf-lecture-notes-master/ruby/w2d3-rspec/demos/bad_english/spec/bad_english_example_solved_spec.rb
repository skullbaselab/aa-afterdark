require 'board'

describe Board do

  it "has an empty grid" do
    expect(subject.grid).to be([[nil, nil], [nil, nil]])
  end

  it "plays a game" do
    expect([1,2,3,4,5]).to eq([1,2,3,4])
  end

  it "sets its pieces" do
    expect(subject.grid).to be([["pawn", "pawn"], ["rook", "rook"]])
  end

end
