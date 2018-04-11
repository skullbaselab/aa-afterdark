require "cat"

describe Cat do

  let(:cat) { Cat.new("Sennacy") }

  describe "#name" do

    it "is given on creation" do
      expect(cat.name).to eq("Sennacy")
    end

    it "can be adjusted anytime" do
      cat.name = "Sennacy The Great"
      expect(cat.name).to eq("Sennacy The Great")
    end

  end

  describe "#meow" do
    it "returns a meow string" do
      expect(cat.meow).to eq("meow!")
    end
  end

  describe "#hiss" do
    it "returns a hiss string" do
      expect(cat.hiss).to eq("hiss!")
    end
  end

  describe "#encounter_dog" do

    let(:dog) { double(:dog) }

    it "meows when dog is friendly" do
      # class Dog
      #   def friendly?
      #     true
      #   end
      # end
      #
      # dog = Dog.new

      # dog = double(:dog)
      allow(dog).to receive(:friendly?).and_return(true)

      # expect(cat.encounter_dog(dog)).to eq("meow!")

      expect(cat).to receive(:meow)
      cat.encounter_dog(dog)
    end

    it "hisses when dog is not friendly" do
      # class Dog
      #   def friendly?
      #     false
      #   end
      # end
      #
      # dog = Dog.new

      # dog = double(:dog)
      allow(dog).to receive(:friendly?).and_return(false)

      # expect(cat.encounter_dog(dog)).to eq("hiss!")

      expect(cat).to receive(:hiss)
      cat.encounter_dog(dog)
    end

  end
end