require 'rspec'
require 'sloth'
require 'food'

RSpec.describe Sloth do

  subject(:sloth) { Sloth.new("Herald") }

  describe "#initialize" do
    it "assigns the sloth a name" do
      expect(sloth.name).to eq("Herald")
    end

    it "starts with an empty food array" do
      expect(sloth.foods).to be_empty
    end

    it "starts with an empty drinks hash" do
      expect(sloth.drinks.keys).to be_empty
    end
  end

  describe "#run" do
    context "when an incorrect direction is given" do
      it "raises ArgumentError" do
        expect { sloth.run("somewhere") }.to raise_error(ArgumentError)
      end
    end

    context "When a valid direction is given" do
      it "returns a string that includes the direction" do
        expect(sloth.run("north")).to include("north")
      end
    end
  end

  describe "#eat" do
    let(:pear) { double("pear", to_s: "pear") } 

    it "adds a food to the foods array" do
      # pear = Food.new("pear")
      sloth.eat(pear)

      expect(sloth.foods).to include(pear)
    end

    it "returns a string with the food" do
      # pear = double("pear", to_s: "pear")
      expect(sloth.eat(pear)).to include("pear")
    end
  end

  describe "#drink" do
    context "without previous drinks" do
      it "adds the beverage key and value to the drinks hash" do
        sloth.drink("green tea", 100)
        expect(sloth.drinks).to have_key("green tea")
        expect(sloth.drinks["green tea"]).to eq(100)
      end
    end

    context "with a previous drink" do
      before(:each) do
        sloth.drink("green tea", 100)
      end

      it "adds the values to beverages that are already there" do
        sloth.drink("green tea", 100)
        expect(sloth.drinks["green tea"]).to eq(200)
      end

      it "does not confuse beverages" do
        sloth.drink("oolong tea", 100)
        expect(sloth.drinks['oolong tea']).to eq(100)
        expect(sloth.drinks['green tea']).to eq(100)
      end
    end
  end

  describe "#hangry" do
    context "when the food array is empty" do
      it "is hangry" do
        expect(sloth).to be_hangry
      end
    end

    context "when the food array is not empty" do
      let(:pear) { double("pear", to_s: "pear") }
      it "is not hangry" do
        sloth.eat(pear)
        expect(sloth).to_not be_hangry
      end
    end
  end
   
  # don't do this!
  describe "#secret_sloth" do
    it "includes secret in the response" do
      expect(sloth.secret_sloth).to include("secret")
    end
  end
end