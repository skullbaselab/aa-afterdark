require 'rspec'
require 'hamster'
require 'byebug'

describe Hamster do
  subject(:hamtaro) { Hamster.new("Hamtaro", 3) }

  describe "#initialize" do

    it "gives a hamster a name" do
      expect(hamtaro.name).to eq("Hamtaro")
    end

    it "assigns the hamster a strength" do
      expect(hamtaro.strength).to eq(3)
    end
  end

  describe "#eat_carrot" do
    # # let(:old_strength) { hamtaro.strength }
    # before(:each) do
    #   old_strength = hamtaro.strength
    #   hamtaro.eat_carrot
    # end
    it "increments strength" do
      old_strength = hamtaro.strength
      hamtaro.eat_carrot

      expect(hamtaro.strength).to be > old_strength
      expect(old_strength).not_to be >= hamtaro.strength
    end

    it "increments strength by just one" do
      old_strength = hamtaro.strength
      hamtaro.eat_carrot

      expect(hamtaro.strength - 1 == old_strength).to be true
    end
  end

  describe "#swole?" do
    let(:rock_taro) { Hamster.new("Rock-taro", 20) }

    context "when hamster is super strong" do
      it "returns true if a hamster is strong" do
        # expect(rock_taro.swole?).to be true
        expect(rock_taro).to be_swole
      end
    end

    context "when hamster is weak sauce" do
      it "returns false if a hamster is weak" do
        expect(hamtaro).not_to be_swole
      end
    end
  end

  describe "#climb_stairs" do
    context "when a hamster is swole" do
      it "should not raise an error" do
        10.times { hamtaro.eat_carrot }
        expect { hamtaro.climb_stairs }.not_to raise_error
      end
    end

    context "when a hamster is not swole" do
      it "should raise an error" do
        expect { hamtaro.climb_stairs }.to raise_error(WeakSauceError)
      end
    end
  end

  describe "#encounter_bird" do
    let(:pigeon) { double("pigeon", type: "pigeon") }

    context "when the bird is small" do
      it "should fight and not run" do
        expect(hamtaro).to receive(:fight)
        expect(hamtaro).not_to receive(:run)
        hamtaro.encounter_bird(pigeon)
      end
    end

    let(:hawk) { double("hawk") }

    context "when the bird is a hawk" do
      it "runs and does not fight" do
        allow(hawk).to receive(:type).and_return("hawk")

        expect(hamtaro).to receive(:run)
        expect(hamtaro).not_to receive(:fight)
        hamtaro.encounter_bird(hawk)
      end
    end
  end
end





















#end
