require 'byebug'
#########################
# PRIVATE AND PROTECTED #
#########################
  # use private and protected methods to expose a limited interface
  # to the user of the class or other classes that interact with the class

  class Human
    attr_reader :name

    def initialize(name)
      @name = name
      @awesomeness = rand(10)
    end

    def reveal_secret
      secret
      # works because a private method CAN be called implicitly

      # self.secret --> does not work! cannot explicitly call a private methods
    end

    def change_name(new_name)
      # name = new_name --> just sets new_name to a local variable "name"

      self.name = new_name
        # private writer methods MUST be called explicitly (exception to the rule!)
    end

    def matching_awesomeness?(other_human)
      self.is_awesome? == other_human.is_awesome?
      # protected methods CAN be called explicitly on self
      # or another instance of the same class BUT
      # this only works when called from WITHIN that class
    end

    protected

    def is_awesome?
      @awesomeness > 5
    end

    private

    def secret
      "I am #{name}. I am a robot."
    end

    # attr_writer :name
    def name=(new_name)
      @name = new_name
    end
  end

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

    def walk
    #   duck typing - QUACK QUACK
    #   this allows us to interact with all subclasses with the
    #   same methods without it breaking.
    end

    def make_animal_sing
      self.sing
    end

    def matching_awesomeness?(other_human)
      self.is_awesome? == other_human.is_awesome?
      # protected methods CAN be called explicitly on self
      # or another instance of the same class BUT
      # this only works when called from WITHIN that class
    end

    protected
    def sing
      puts "Fa la la la laaaaa"
    end

    def is_awesome?
      10 > 5
    end
  end

  module Walkable
    def walk
      puts "My feet are moving!"
    end
  end

  class Dog < Animal
    include Walkable
      # include - every method in module becomes instance method
      # extend - every method in module becomes CLASS method

    def bark
      puts "woof"
    end

    def walk
      puts "I walk like a dog - woof"
    end

  end

  class Cat < Animal
    include Walkable

    def initialize(name, owner)
      @fierceness = 5000
      @owner = owner
      super(name)
        # invoke the superclass method of the same name
        # passes all arguments by default unless you specifiy
        # which arguments to pass on
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


##################
# Error Handling #
##################

  # begin - try to do anything in this section, if there's an error =>
  # rescue - executes if an error happens in the begin section

  def rescue_all
    # NB Don't ever do this!

    begin
       0 / 0 # raises ZeroDivisionError
    rescue
      # no argument to rescue will rescue ALLLLL errors - not helpful!
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

  # ensure - no matter what happens with begin and rescue, execute this code

  def rescue_with_ensure
    begin
      this_is_not_a_method_or_variable # raises NameError
    rescue ZeroDivisionError
      puts "We won't see this"
    ensure
      puts "This will print no matter what happens"
    end

    puts "BANANAS"
  end

  class InvalidInputError < StandardError
    # you can make your own custom errors, they should inherit
    # from StandardError. You can then give your error a specific
    # name that is useful for you.
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
