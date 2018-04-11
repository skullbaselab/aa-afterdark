require 'rspec'
# knows to look in the lib folder
require 'cat'

describe Cat do
  let(:nombre)  { "Sennacy" }
  subject(:cat) { Cat.new(nombre) }

  describe '#name' do
    it 'returns the cat\'s name' do
      expect(cat.name).to eq(nombre)
    end
  end

  describe '#name=' do
    it 'sets the cat\'s name' do
      cat.name = "whatever"
      expect(cat.name).to eq("whatever")
    end
  end

  describe '#dare' do
    let(:dog) { double(:dog, size: 50) }

    it 'makes the cat meow' do
      # make sure you expect an object to receive a method before you try to call
      # sort of like listening
      # we're not checking return value, we're making sure #meow gets called
      expect(cat).to receive(:meow)

      cat.dare(dog)
    end

    context 'when the dog is small' do
      # we'd need to make an entire Dog class when we only want to test Cat
      # let(:dog) { Dog.new}

      it 'makes the cat attack' do
        allow(dog).to receive(:size).and_return(10)

        expect(cat).to receive(:attack)
        expect(cat).not_to receive(:flee)

        cat.dare(dog)
      end
    end

    context 'when the dog is large' do
      it 'makes the cat flee' do
        allow(dog).to receive(:size).and_return(100)

        expect(cat).to receive(:flee)
        expect(cat).not_to receive(:attack)

        cat.dare(dog)
      end
    end
  end

end
