require "cat"
require "byebug"

describe Cat do
  subject(:cat) { Cat.new('orpheus') }

  describe '#name' do
    it "returns the cat's name" do
      # cat = Cat.new('orpheus')
      expect(cat.name).to eq('orpheus')
    end
  end

  describe '#name=' do
    it "sets the cat's name" do
      # cat = Cat.new('orpheus')
      cat.name = 'sennacy'
      expect(cat.name).to eq('sennacy')
    end
  end

  describe "#meow" do
    it "returns a meow string" do
      expect(cat.meow).to eq('mrrwww')
    end
  end

  describe "#hiss" do
    it "returns a hiss string" do
      expect(cat.hiss).to eq('hisss')
    end
  end

  describe "#encounter_dog" do
    let(:dog) { double('dog', bark: 'sup', friendly?: true) }

    context "when dog is friendly" do
      # good practice to separate the setup from the expectations
      # before(:each) do
      #   allow(dog).to receive(:friendly?).and_return(true)
      # end

      it "meows" do
        # debugger
        expect(cat).to receive(:meow)
        expect(cat).not_to receive(:hiss)

        cat.encounter_dog(dog)
      end
    end

    context "when dog is not friendly" do
      before(:each) do
        allow(dog).to receive(:friendly?).and_return(false)
      end

      it "hisses" do
        expect(cat).to receive(:hiss)
        expect(cat).not_to receive(:meow)

        cat.encounter_dog(dog)
      end
    end
  end
end
