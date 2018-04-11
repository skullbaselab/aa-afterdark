describe BoardTwo do

  describe "#initialize" do
    let!(:pieces) {double(color: "white")}

    let!(:board_displayer) {double}
    let!(:location) {double}
    let!(:owner) {double}
    let!(:referee) {double}
    let!(:catnip) {double}
    let!(:tuna_salad) {double}

    it "makes you pass in a bunch of crap" do
      BoardTwo.new(pieces, board_displayer, location, owner, referee, catnip, tuna_salad)
    end
  end
end
