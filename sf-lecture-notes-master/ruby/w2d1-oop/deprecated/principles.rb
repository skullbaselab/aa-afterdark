class Animal # ENCAPSULATION
  attr_reader :species

  def move # POLYMORPHISM
    puts 'Animal moves'
  end

  def consume(food = nil) # POLYMORPHISM
    puts "I consume #{food} like a savage" if food
  end

  private # Abstraction / Information Hiding

  def initialize(species)
    @species = species
  end
end

class Human < Animal # Inheritance
  attr_reader :name

  def move # POLYMORPHISM
    puts 'Human moves'
    super
  end

  def consume(food) # POLYMORPHISM
    puts 'We are not savages'
    super('apple')
  end

  private # Abstraction / Information Hiding

  def initialize(name)
    @name = name
    super('human')
  end
end

p kelly = Human.new("Kelly")
kelly.consume()
