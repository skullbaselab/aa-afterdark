require "cat"

describe Cat do
  subject(:cat) { Cat.new("Sennacy") }
  #use subject if the object you are specifically testing

  describe '#name' do
    it "returns the cat's name" do
      expect(cat.name).to eq("Sennacy")
    end
  end

  describe '#name=' do
    before(:each) do #don't use before(:all)
      cat.name = "Markov"
    end

    it "sets the cat's name" do
      expect(cat.name).to eq("Markov")
    end
  end

  describe "#meow" do
    it "returns a meow string" do
      expect(cat.meow).to start_with("m")
      expect(cat.meow).to end_with("w")
    end
  end

  describe "#hiss" do
    it "returns a hiss string" do
      expect(cat.hiss).to match(/sss/)
    end
  end

  describe "#encounter_dog" do
    let(:dog) { double('doggie', { friendly?: true }) }

    #Class Dog
      #def friendly?
        #true
      #end
    #end

    context "when dog is friendly" do
    #context is just a more semantic alias for describe
      it "meows" do
        expect(cat).to receive(:meow)
        expect(cat).not_to receive(:hiss)
        cat.encounter_dog(dog)
      end
    end

    context "when dog is not friendly" do
      before do #by default runs before each test
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
