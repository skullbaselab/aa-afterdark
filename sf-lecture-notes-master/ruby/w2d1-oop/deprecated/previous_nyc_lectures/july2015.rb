## PRIVATE AND PROTECTED (AND PUBLIC)

class Cat
  def meow
    puts "meow"
  end

  def plan_day
    self.meow
    self.sneaky #=> ERROR because explicit receiver
    sneaky #=> no error because implicit receiver


    self #=> Cat instance
  end

  def conspire_with(other_cat)
    self.dream
    other_cat.dream
  end

  protected # can be explicitly called on same instances of class (including self)

  def dream
    puts "World domination"
  end

  private # can only be implicitly called

  def sneaky
    puts "I watch you when you sleep"
  end
end


## INHERITANCE (single-class inheritance)

class Animal
  attr_reader :color

  def initialize(color, size)
    @color = color
  end
end

class Cat < Animal
  attr_reader :name

  def initialize(name)
    super("orange", "big")
    @name = name
  end

  def size
    raise NotImplementedError.new "Must define #size in subclass"
  end

  def meow
    color
    puts "meow"
  end

  def hello
    puts "i am #{size}"
  end

  def sleep
    puts "zzzz"
  end
end

class Lion < Cat
  def initialize(name, prey)
    # @name, @prey = name, prey
    super(name)
    @size = "big"
    @prey = prey
  end

  def roar
    puts "roar"
  end

  def plan_day
    meow
    sleep
    roar
  end
end

class HouseCat < Cat
  def initialize(name)
    super(name)
    @size = "small"
  end
end

# class Thing
#   def sit
#
#   end
# end

module Sittable
  def sit
    "sit on #{location}"
  end
end

class Lamp
  include Sittable

  def location
    "nightstand"
  end
end

class Cat
  include Sittable

  def location
    "keyboard"
  end
end


## EXCEPTIONS

class Cat
  def play_with(toy)
    puts "chewing on toy"

    begin
      toy.chew
    rescue ToyDeadError => error
      puts error.message
      # puts "my toy is dead :("
      puts "walk away"
    rescue RunTimeError
      puts "run time error"
    end
  end

  def guess_secret
    puts "welcome"
    puts "things"

    begin
      puts "guess my secret!"
      get_guess
    rescue ArgumentError
      puts "invalid number"
      retry
    end
  end

  private
  def get_guess
    Integer(gets.chomp)
  end
end

class Toy
  attr_accessor :lives

  def initialize(lives)
    @lives = lives
  end

  def chew
    self.lives -= 1
    puts "kfggggggggg"
    puts "#{lives} lives left!"
    raise ToyDeadError.new("almost dead!") if lives == 1
    raise ToyDeadError.new("out of yarn!") if lives == 0
  end
end

class ToyDeadError < StandardError
end
