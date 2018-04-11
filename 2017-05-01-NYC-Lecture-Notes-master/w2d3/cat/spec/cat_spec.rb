require 'cat'

describe Cat do
  subject(:cat) { Cat.new("carrot") }

  it "has a name" do
    expect(cat.name).to eq('carrot')
  end

  it "can change it's name" do
    expect(cat.name).to eq('carrot')
    cat.name = 'satchel'
    expect(cat.name).to eq('satchel')
  end

  describe "#meow" do
    it "returns a meow string" do
      expect(cat.meow).to eq('meowww')
    end
  end

  describe "#hiss" do
    it "returns a hiss string" do
      expect(cat.hiss).to eq('hisss')
    end
  end

  describe "#encounter_dog" do
    let(:weak_dog) { double("dog", size: 8999) }
    let(:strong_dog) { double("dog", size: 9001) }
    context "when dog is small" do
      it "attacks" do

        # class Dog
        #   def size
        #     10
        #   end
        # end
        #
        # dog = Dog.new

        # allow(weak_dog).to receive(:size).and_return(10)

        expect(cat).to receive(:attack)
        cat.encounter_dog(weak_dog)

      end
    end

    context "when dog is large" do
      it "it flees" do

        # allow(dog).to receive(:size).and_return(9001)

        expect(cat).to receive(:flee)
        cat.encounter_dog(strong_dog)
      end
    end
  end
end
