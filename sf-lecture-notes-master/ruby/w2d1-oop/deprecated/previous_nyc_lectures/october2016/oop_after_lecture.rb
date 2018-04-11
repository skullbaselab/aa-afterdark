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

    def reveal_secret
      # Works! Uses an 'implicit' call
      secret

      # Does not work!
      # private methods cannot have an explicit receiver (self)
      # self.secret # => NoMethodError: private method `secret' called for
    end

    def change_name(new_name)
      # oh noes, this is just a local variable
      # name = new_name

      # exception to 'no explicit self rule'
      # otherwise no way to access setter methods
      self.name = new_name
    end

    def matching_awesomeness?(other_human)
      # for protected methods can call explicitly or implicitly
      self.is_awesome? == other_human.is_awesome?
    end

    # why use private/protected?
    # 1. Tells others how to use your code
    # 2. Hides implementation details (can change on the fly without breaking others code)

    # methods available to other instances of same class
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

  class Animal
    attr_reader :name, :stomach

    def initialize(name)
      @name = name
      @stomach = []
    end

    def eat(food)
      stomach << food
    end
  end

  # provides behavior
  module Walkable
    def walk
      puts "My feet are moving!"
    end

    def empty_stomach
      @stomach = []
    end
  end

  class Dog < Animal

    include Walkable

    def initialize(name, owner)
      super(name) # implicit arguments pass everything, breaks if mismatched with parent class
      @tail = nil
      @owner = owner
    end

    def eat(food = "rocks")
      super(food)
    end

    def bark
      puts "woof"
    end
  end

  class Cat < Animal

    include Walkable

    def walk
      puts "I don't wanna"
    end

    def meow
      puts "mrrwww"
    end
  end

  class Fish < Animal

    def swim
      puts "I'm swimming!"
    end

  end

  ella = Dog.new("Ella", "Daniel")
  sennacy = Cat.new("Sennacy")
  flounder = Fish.new("Flounder")


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
      # this_is_not_a_method_or_variable # raises NameError
      0 / 0
    rescue ZeroDivisionError
      puts "We won't see this"
    ensure # still hits ensure even if no error is thrown
      puts "This will print no matter what happens"
    end
  end

  class InvalidInputError < StandardError
  end
  # raise InvalidInputError
  # puts "hey there"

  class Game
    attr_accessor :attempts

    def initialize
      @attempts = 3
    end

    def run
      begin
        take_turn!
      rescue InvalidInputError => error
        # debugger
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
        # 0 / 0 # would raise divide by zero error
        raise InvalidInputError.new("You didn't type X")
      end
    end
  end
