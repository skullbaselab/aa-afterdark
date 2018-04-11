require 'byebug'
#########################
# PRIVATE AND PROTECTED #
#########################

  class Human
    attr_reader :name

    def initialize(name)
      @name = name
      @awesomeness = rand(10) + 1 # 1 ≤ awesome ≤ 10
    end

    def reveal_secret
      # self.secret BADDD
      secret  #implicit call on #secret # GOOOD
    end

    def change_name(new_name)
      self.name = new_name
      debugger
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

  # PRIVATE:
  #  > can only be called implicitly on self - self.method_name will not work!
  #     > except for private setters (#method=) need to have self. in front, otherwise
  #     > will set local variable
  #  > everything under private keyword will be private until specified otherwise
  #
  # PROTECTED:
  #  > can explicitly call on self. and other instances of the same class,
  #  > or other instances of a class which inherits from the
  #  > class where the protected method is defined


###########################
# INHERITANCE AND MODULES #
###########################

  module Walkable

    def walk
      puts "My feet are moving!"
    end

  end

  class Animal
    attr_reader :name, :stomach

    def initialize(name)
      @name = name
      @stomach = []
    end

    def eat(food)
      stomach << food
    end

    def reveal_other_secret(other_animal)
      other_animal.secret
    end


  end

  class Dog < Animal
    include Walkable
    # attr_reader :name, :stomach
    attr_reader :breed
    #
    def initialize(name, breed)
      # @name = name
      # @stomach = []
      super(name)
      @breed = breed

    end
    #
    # def eat(food)
    #   stomach << food
    # end


    # def walk
    #   puts "My feet are moving!"
    # end

    def bark
      puts "woof"
    end

    protected
    def secret
      puts "All animals are actually aliens!"
    end
  end

  class Cat < Animal
    include Walkable

    # attr_reader :name, :stomach
    #
    # def initialize(name)
    #   @name = name
    #   @stomach = []
    # end
    #
    # def eat(food)
    #   stomach << food
    # end

    # def walk
    #   puts "Cat is walking"
    # end

    def meow
      puts "meowww"
    end

    protected
    def secret
      puts "All animals are actually aliens!"
    end
  end

  class Fish < Animal
    # attr_reader :name, :stomach
    #
    # def initialize(name)
    #   @name = name
    #   @stomach = []
    # end
    #
    # def eat(food)
    #   stomach << food
    # end

    def swim
      puts "I'm swimming!"
    end

  end

  # floyd = Dog.new("Floyd")
  # sennacy = Cat.new("Sennacy")
  # flounder = Fish.new("Flounder")
  # floyd.eat("french fry")
  # puts floyd.stomach
  # sennacy.eat("french fry")
  # puts sennacy.stomach
  # flounder.eat("french fry")
  # puts flounder.stomach

  # sennacy.walk
  # floyd.walk

  # c = Cat.new("fluffy", "scruffy")
  # c.walk
  # floyd.walk


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
      puts 'Trying to divide by 0 now.'
      0 / 0 # raise ZeroDivisionError
      Integer('random')
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

  # rescue_all
  # rescue_specific

  # rescue_with_ensure

  class GameError < StandardError
  end

  class InvalidInputError < GameError
  end

  # Try to catch specific errors.
  # Errors stack trace bubbles up!!
  # begin rescue end blocks

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
        raise InvalidInputError.new("You didn't type X")
      end
    end
  end

  # g = Game.new
  # g.run
