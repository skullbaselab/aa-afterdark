require 'cat'

describe Cat do

  subject(:cat) { Cat.new("Carrot") }

  describe '#name' do

    it 'should return name' do
      # cat = Cat.new("Carrot")
      expect(cat.name).to eq("Carrot")

    end

  end

  describe '#name=' do

    it 'should reassign cat\'s name' do
      # cat = Cat.new("Carrot")
      cat.name = "Dog"
      expect(cat.name).to eq("Dog")

    end

  end

  describe '#meow' do

    it "should append 'meow' to user's input" do

      expect(cat.meow("I'm hungry")).to end_with(" meow")
      expect(cat.meow("I'm hungry")).to include("I'm hungry")

    end

  end

  describe '#hiss' do

    it "should raise an error" do

      expect { cat.hiss }.to raise_error("invalid input")

    end

  end

  describe '#encounter_dog' do

    let(:clifford) { double("Clifford", size: 9001) }
    let(:small_clifford) { double("Small Clifford", size: 8999) }

    context "when dog is large" do

      it "should flee" do

        # allow(clifford).to receive(:size).and_return(9001)
        # Can pass in method name as symbol or as string
        expect(cat).to receive(:flee)
        expect(cat).not_to receive(:attack)
        cat.encounter_dog(clifford)

      end

    end

    context "when dog is small" do

      it "should attack" do

        # allow(small_clifford).to receive(:size).and_return(8999)
        expect(cat).to receive(:attack)
        expect(cat).not_to receive(:flee)
        cat.encounter_dog(small_clifford)

      end

    end

  end

end
