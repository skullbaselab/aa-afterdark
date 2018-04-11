[Cat Class](./lib/cat.rb)
```ruby
class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meet_dog(dog)
    if dog.size < 10
      "Hisssss"
    else
      "Scamper"
    end

  end

end

class Dog
  attr_reader :height, :weight

  def initialize(name, height, weight, state)
    @name = name
    @height = height
    @weight = weight
    @state = state
    take_to_vet
    chase_tail
  end

  def size
    (height + weight) / 2
  end

  def take_to_vet
    # complicated code!
  end

  def chase_tail
    # complicated code!
  end

  def bark_at_neighbor
    # complicated code!
  end
end

```

[Cat Spec](./spec/cat_spec.rb)  
```ruby
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

```
