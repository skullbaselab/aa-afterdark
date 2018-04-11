require 'cat'

describe Cat do
  subject(:cat) { Cat.new("Sennacy") }

  describe '#name' do

    it 'can be changed' do
      cat.name = "George"
      expect(subject.name).to eq("George")
      # expect{ cat.name = "George" }.to change{ cat.name }
    end

    it 'is given on creation' do
      expect(subject.name).to eq("Sennacy")
    end

  end


  describe '#meet_dog' do
    # let(:dog) { Dog.new("Luna", 10, 20, "NY") }

    let(:dog) { double("fido", size: 5) }

    it 'hisses when the dog is small' do
      # dog is not a variable really
      # it is a method that returns the dog double
      # allow(dog).to receive(:size).and_return(5)
      expect(cat.meet_dog(dog)).to eq("Hisssss")
    end

    it 'scampers when the dog is large' do
      allow(dog).to receive(:size).and_return(15)
      expect(cat.meet_dog(dog)).to eq("Scamper")
    end
  end
end

# If you're expecting an error, you must pass the expectation in a block, not parentheses
