require "cat"

describe Cat do
  describe '#name' do
    it "returns the cat's name"
  end

  describe '#name=' do
    it "sets the cat's name"
  end

  describe "#meow" do
    it "returns a meow string"
  end

  describe "#hiss" do
    it "returns a hiss string"
  end

  describe "#encounter_dog" do
    context "when dog is friendly" do
      it "meows"
    end

    context "when dog is not friendly" do
      it "hisses"
    end
  end
end
