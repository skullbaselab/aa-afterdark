require 'byebug'
class Card
  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    values = VALUES

    while num_pairs > values.length
      values = values + values
    end

    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!
    values.map { |val| self.new(val) }
  end

  attr_reader :value

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def to_s
    # monkey-patching Ruby's native to_s for Objects
    revealed? ? "#{value}" : " "
  end

  def reveal
    @revealed = true
  end

  def revealed?
    # by convention, methods tht return bools end with question marks in Ruby
    # so we wrote this instead of using the standard attr_reader
    @revealed
  end

  def ==(object)
    # monkey-patching Ruby's native == for Objects
    # how do we call this method???
    # card.==(card)??
    # nah bro, card == card (thanks ruby!!)

    object.is_a?(self.class) && object.value == value
    #                                           ^ self.value,
    #                                   probably better to be explicit, honestly
  end
end
