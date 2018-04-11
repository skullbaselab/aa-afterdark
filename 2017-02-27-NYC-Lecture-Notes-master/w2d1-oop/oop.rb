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
      secret
      # self.secret  --> error!
    end

    def change_name(new_name)
      # name = new_name #assigns local variable..
      self.name = new_name #works! can explicitly use self with private attr_writers
    end

    def matching_awesomeness?(other_human)
      self.is_awesome? == other_human.is_awesome?
    end

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

  #private methods:
  # - cannot be called outside definition of class its defined in
  # - cannot be called with explicit receiver (except for attr_writers)

  #protected methods:
  # - cannot be called outside definition of class its defined in
  # - can be called with explicit receiver

  #Motivation:
  # - minimize exposure
  # - think about intended interface
  # - helps minimize class coupling

  # daniel = Human.new("Daniel")
  # # puts daniel.secret
  # # puts daniel.reveal_secret
  #
  # # puts daniel.name
  # # # daniel.name = "Fred"
  # # daniel.change_name("Fred")
  # # puts daniel.name
  #
  # tommy = Human.new("Tommy")
  # # puts daniel.is_awesome?
  # puts tommy.matching_awesomeness?(daniel)


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


  module Walkable
    def walk
      puts "My feet are moving!"
    end

    # def self.some_method #ends up making a method on Walkable
    # end
  end
  #
  # module Movable
  #   include Walkable
  #   def walk
  #     puts "test walk"
  #   end
  # end

  class Dog < Animal
    include Walkable #includes methods in walkable as instance methods (`extend` adds them as class methods)

    # def walk
    #   puts "My feet are moving!"
    # end

    def bark
      puts "woof"
    end
  end

  #prefer modules when 2+ classes share behavior(e.g. walking) but not attributes
  #prefer a parent class when 2+ classes share behavior and attributes(e.g. stomach, name..)

  class Cat < Animal
    include Walkable #includes methods in walkable as instance methods (`extend` adds them as class methods)

    # attr_reader :names, :stomach
    #
    def initialize(name, friend)
      @friend = friend
      super(name) # without explicitly given arguments, super will take in all arguments passed into initialize
    end
    #
    # def eat(food)
    #   stomach << food
    # end

    def walk
      puts "I really don't want to go on this walk because I am a cat and I don't like to walk."
      super
    end

    def meow
      puts "mrrwww"
    end
  end

  class Fish < Animal
    # attr_reader :names, :stomach
    #
    # def initialize(name)
    #   @name = name
    #   @stoamch = []
    # end
    #
    # def eat(food)
    #   stomach << food
    # end

    def swim
      puts "I'm swimming!"
    end
  end

  ella = Dog.new("Ella")
  sennacy = Cat.new("Sennacy", "Fluffy")
  flounder = Fish.new("Flounder")
  # ella.eat("french fry")
  # puts ella.stomach
  # sennacy.eat("french fry")
  # puts sennacy.stomach
  # flounder.eat("french fry")
  # puts flounder.stomach

  # sennacy.walk
  # ella.walk

  # c = Cat.new("fluffy", "scruffy")
  # c.walk
  # ella.walk


##################
# Error Handling #
##################

#two ways to handle bad input:
# 1) regular control flow
# 2) begin/rescue errors

  def rescue_all
    # NB Don't ever do this!

    begin
      # 0 / 0 # raises ZeroDivisionError
      nil + 7
    rescue
      puts "Something went wrong!"
    end
  end

  def rescue_specific
    begin
      0 / 0 # raise ZeroDivisionError
      #nil + 7 #this would shut down program
      # specific is better
    rescue ZeroDivisionError => error # maps the rescued error to 'error' variable
      # debugger
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

  # rescue_all
  # rescue_specific
  # rescue_with_ensure

  class InvalidInputError < StandardError
    #gives us a custom error with a specific name but all the regular methods
  end

  class Game
    attr_accessor :attempts

    def initialize
      @attempts = 3
    end

    def run
      begin
        take_turn!
      # we only want to rescue InvalidInputError
      rescue InvalidInputError => error
        # debugger
        puts error.message

        self.attempts -= 1
        retry if attempts > 0 # retry will prevent hitting the ensure
      ensure
        puts "Nice try"
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

  g = Game.new
  g.run


  # NB GO OVER THE QUIZ
