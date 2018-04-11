require_relative 'food'

class Sloth
  attr_reader :name, :foods, :drinks
  DIRECTIONS = %w(north east south west).freeze

  def initialize(name)
    @name = name
    @foods = []
    @drinks = Hash.new(0)
  end

  def run(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    "I'm running #{direction} at 0.00001 miles per hour!"
  end

  def eat(food)
    @foods << food
    "I am eating #{food}!"
  end

  def drink(beverage, amount)
    @drinks[beverage] += amount
  end

  def hangry?
    foods.empty?
  end

  protected

  def secret_sloth
    "shhhh... this method is secret"
  end
end
