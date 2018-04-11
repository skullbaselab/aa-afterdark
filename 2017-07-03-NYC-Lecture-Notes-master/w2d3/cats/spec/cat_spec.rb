require 'cat'

describe Cat do

  subject(:cat) { Cat.new("Jerry") }
  let(:max) { Cat.new("Max") }

  describe "#name" do
    it "reads the cats name" do
      # max = Cat.new("Max")
      expect(cat.name).to eq("Jerry")
      expect(max.name).to eq("Max")
    end
  end

  describe "#name=" do
    # The reassignment we complete, since we have created
    # a subject, is local to this it block
    it "reassigns the name" do
      expect(cat.name).to eq("Jerry")
      cat.name = "Bob"
      expect(cat.name).to eq("Bob")
    end
  end

  # Where did start_with and include come from???
  # The rspec docs are a great place to look for rspec methods
  describe "#meow" do
    it "adds meow to the user input" do
      expect(cat.meow("Mix")).to start_with("meow")
      expect(cat.meow("Mix")).to include("Mix")
    end
  end

  describe "#encounter_dog" do
    let(:clifford) { double("Clifford", { :size => "BIG" } )  }
    let(:smaller_clifford) { double("Smaller Clifford", { :size => "small" } )  }


    context "when the dog is strong" do

      # Example to demonstrate before
      # before(:each) do
      #   allow(clifford).to receive(:bark)
      # end

      it "runs away" do
        # allow(clifford).to receive(:size).and_return("BIG")
        expect(cat).not_to receive(:attack)
        expect(cat).to receive(:flee)
        cat.encounter_dog(clifford)
      end

    end

    context "when the dog is weak" do
      it "attacks the dog" do
        # allow(smaller_clifford).to receive(:size).and_return("BIG")
        expect(cat).to receive(:attack).with(smaller_clifford)
        expect(cat).not_to receive(:flee)
        cat.encounter_dog(smaller_clifford)
      end
    end

  end

  # Wrap the method call in brackets in order to catch
  # our error in the rspec execution
  describe "#hiss" do
    it "throws a hissing error" do
      expect do
        cat.hiss
      end.to raise_error("Hisss!!!!")
    end
  end

  describe "#cat_block" do

    it "yields a block" do
      expect { |block| cat.cat_block(&block) }.to yield_control
    end

  end

end













# Bottom of file
