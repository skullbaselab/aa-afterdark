require 'rspec'
require 'card'
require 'hand'

describe Hand do
  context "when hand has three cards" do
    let(:cards) do
      card_vals = ["2D", "3H", "JS"]
      cards = card_vals.map do |val|
        Card.new(val)
      end
    end

    subject(:hand) do
      Hand.new(cards)
    end

    it "should have cards" do
      # its(:cards) { should == cards }
      expect(hand.cards).to eq(cards)
    end

    it "should know highest card" do
      # its(:highest_card) { should == cards[2] }
      expect(hand.highest_card).to eq(cards[2])
    end
  end
end
