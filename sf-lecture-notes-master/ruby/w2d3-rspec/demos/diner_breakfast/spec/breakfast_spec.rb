require 'breakfast'

describe Breakfast do
  subject(:hash_browns) { Breakfast.new("hash browns", 10) }

  describe "initialize" do
    # does not work
    before(:each) do
      hash_browns = Breakfast.new("hash browns", 10)
    end

    it 'sets the type' do
      expect(hash_browns.type).to eq("hash browns")
    end

    it 'sets the quantity' do
      expect(hash_browns.quantity).to eq(10)
    end

    it 'sets the temp' do
      expect(hash_browns.temp).to eq(40)
    end
  end

  describe "cook" do
    it "increases the temperature by 200" do
      hash_browns.cook
      expect(hash_browns.temp).to eq(240)
    end
  end

  describe "eat" do
    let("claire") { double("claire", name: "Claire") }

    it 'raises an error when food is not yet cooked' do
      expect { hash_browns.eat(10, claire) }.to raise_error("Not cooked yet!")
    end

    it 'raises an error when there is not enough food left' do
      expect { hash_browns.eat(20, claire) }.to raise_error("Not cooked yet!")
      hash_browns.cook
      expect do
        hash_browns.eat(20, claire)
      end.to raise_error("Not enough left for that bite size")
    end

    context 'when there is enough food and it is cooked' do
      before(:each) do
        hash_browns.cook
        allow(claire).to receive(:consume)
      end

      it 'decrements quantity by bite size' do
        hash_browns.eat(10, claire)
        expect(hash_browns.quantity).to eq(0)
      end

      it 'calls #consume on the hungry human' do
        expect(claire).to receive(:consume).with(10)
        hash_browns.eat(10, claire)
      end

      it 'returns a string saying who ate how much of what' do
        expect(hash_browns.eat(10, claire)).to include(claire.name, "10", hash_browns.type)
      end
    end
  end
end
