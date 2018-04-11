class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def highest_card
    cards.last
  end
end
