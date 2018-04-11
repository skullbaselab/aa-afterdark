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
    revealed? ? value.to_s : " "
  end

  def reveal
    @revealed = true
  end

  def revealed?
    @revealed
  end

  def ==(object)
    #Compares card object class (first) and the card object value (second)
    object.is_a?(self.class) && object.value == value
    
    # return false unless object.is_a?(self.class) #<-- Functionally the same as above
    # object.value == value #<-- Functionally the same as above
  end
end




















# end of document
