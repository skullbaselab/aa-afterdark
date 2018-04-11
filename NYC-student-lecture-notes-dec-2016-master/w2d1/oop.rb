require 'byebug'
#########################
# PRIVATE AND PROTECTED #
#########################

#expose the smallest interface possible

  class Human
    attr_reader :name

    def initialize(name)
      @name = name
      @awesomeness = rand(10)
    end

    def reveal_secret
      secret
      # self.secret will not work because you can't call private method
      # on an explicit receiver, even self
    end

    def change_name(new_name)
      # name = new_name
      self.name = new_name
      #name=(new_name) does not work
      #When using a writer method, use self.method
    end

    def matching_awesomeness?(other_human)
      self.is_awesome? == other_human.is_awesome?
    end

    protected

    def is_awesome?
      @awesomeness > 5
    end

    private

    # attr_writer :name
    def name=(new_name)
      @name = new_name
    end

    def secret
      "I am #{name}. I am a robot."
    end
  end

  daniel = Human.new("Daniel")
  tommy = Human.new("Tommy")
  # puts daniel.secret
  # puts daniel.name = "Ruby"
  # puts daniel.is_awesome?
  # puts daniel.reveal_secret
  # puts daniel.change_name("Joe")
  # puts daniel.name
  # puts daniel.matching_awesomeness?(tommy)



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
    #note: be carefule with constants and class methods
    def walk
      puts "My feet are moving!"
    end

  end

  class Dog < Animal

    include Walkable

    def initialize(name, owner)
      super(name)
      @owner = owner
    end

    def walk
      puts "I'm a dog"
      super
    end

    def bark
      puts "woof"
    end
  end

  class Cat < Animal

    include Walkable

    def meow
      puts "mrrwww"
    end
  end

  class Fish < Animal

    def swim
      puts "I'm swimming!"
    end

  end

  # ella = Dog.new("Ella", "Daniel")
  # sennacy = Cat.new("Sennacy")
  # flounder = Fish.new("Flounder")
  # puts ella.name
  # puts sennacy.name
  # puts flounder.name
  # ella.walk

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

# rescue_all

  def rescue_specific
    begin
      0 / 0 # raise ZeroDivisionError
      # something
    rescue ZeroDivisionError
      puts "Stop trying to divide by zero!"
    end
  end

  # rescue_specific

  def rescue_with_ensure
    begin
      this_is_not_a_method_or_variable # raises NameError
    rescue ZeroDivisionError
      puts "We won't see this"
    ensure
    puts "This will print no matter what happens"
    end
  end

  rescue_with_ensure

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

      puts attempts > 0 ? "You did it!" : "You need more practice"
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
