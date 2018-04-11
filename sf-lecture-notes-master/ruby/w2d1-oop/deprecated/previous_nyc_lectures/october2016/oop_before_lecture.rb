require 'byebug'
#########################
# PRIVATE AND PROTECTED #
#########################

  class Human
    attr_reader :name

    def initialize(name)
      @name = name
      @awesomeness = rand(10)
    end

    # def reveal_secret
      # secret
      # self.secret
    # end

    # def change_name(new_name)
    #   name = new_name
    #   self.name = new_name
    # end

    # def matching_awesomeness?(other_human)
    #   self.is_awesome? == other_human.is_awesome?
    # end

    protected

    def is_awesome?
      @awesomeness > 5
    end

    private

    def secret
      "I am #{name}. I am a robot."
    end

    def name=(new_name)
      @name = new_name
    end
  end

  # daniel = Human.new("Daniel")


###########################
# INHERITANCE AND MODULES #
###########################

  class Dog
    attr_reader :name, :stomach

    def initialize(name)
      @name = name
      @stomach = []
    end

    def eat(food)
      stomach << food
    end

    def walk
      puts "My feet are moving!"
    end

    def bark
      puts "woof"
    end
  end

  class Cat
    attr_reader :names, :stomach

    def initialize(name)
      @name = name
      @stomach = []
    end

    def eat(food)
      stomach << food
    end

    def walk
      puts "My feet are moving!"
    end

    def meow
      puts "mrrwww"
    end
  end

  class Fish
    attr_reader :names, :stomach

    def initialize(name)
      @name = name
      @stamach = []
    end

    def eat(food)
      stomach << food
    end

    def swim
      puts "I'm swimming!"
    end

  end

  # ella = Dog.new("Ella")
  # sennacy = Cat.new("Sennacy")
  # flounder = Fish.new("Flounder")


##################
# Error Handling #
##################

  def rescue_all
    # NB Don't ever do this!

    begin
      0 / 0 # raises ZeroDivisionError
    rescue
      puts "Something went wrong!"
    end
  end

  def rescue_specific
    begin
      0 / 0 # raise ZeroDivisionError
    rescue ZeroDivisionError
      puts "Stop trying to divide by zero!"
    end
  end

  def rescue_with_ensure
    begin
      this_is_not_a_method_or_variable # raises NameError
    rescue ZeroDivisionError
      puts "We won't see this"
    ensure
      puts "This will print no matter what happens"
    end
  end

  class InvalidInputError < StandardError
  end

  class Game
    attr_accessor :attempts

    def initialize
      @attempts = 3
    end

    def run
      begin
        take_turn!
      rescue InvalidInputError => error
        puts error.message

        self.attempts -= 1
        retry if attempts > 0
      end

      puts "Game Over!"
    end

    def take_turn!
      validate_input(get_input)
    end

    def get_input
      puts "Type X"
      gets.chomp
    end

    def validate_input(input)
      if input != "X"
        raise InvalidInputError.new("You didn't type X")
      end
    end
  end
