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
    # calls secret, a private method.
    # private methods can only be called implicitly
    secret
    # can't have an explicit receiver for private methods, so the following wont work
    # self.secret
  end

  def change_name(new_name)
    # this sets a local variable!
    # name = new_name
    # can't have explicit receiver for private methods, EXCEPT for setter methods
    self.name = new_name
  end



  private

  def secret
    "I am #{name}. I am a robot."
  end

  attr_writer :name
  # def name=(new_name)
  #   @name = new_name
  # end

  protected
  #
  # can only be called within a class,
  # or, one instance of a class can call on another instance of same class or subclass
  #
  def is_awesome?
    @awesomeness > 5
  end

  public

  def matching_awesomeness?(other_human)
    self.is_awesome? == other_human.is_awesome?
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

end

module Walkable
  # modules are a way to package up behavior without state. Use class inheritance if you wanted both.

  # module methods can be declared private! the private keyword will make them private in the class that includes this module.
  # private

  def walk
    # self inside method is the instance of the class
    puts "My feet are moving!"
  end
end

class Dog < Animal
  # you can only inherit from ONE class, but you can include/extend multiple modules

  # include makes module methods instance methods
  # include is just a method, so we can explicitly wrap its arguments in parenthesis
  include(Walkable)
  
  # extend makes module methods class methods
  # extend Walkable

  def bark
    puts "woof"
  end

  # overwriting this method from superclass
  def eat(food)
    # stomach << food
    # call the method of the same name in our superclass
    # calling super without explicitly passing any arguments would pass all arguments received
    super(food)
    bark
  end

  # the following will NOT make the Walkable module methods private!
  # private
  # include Walkable
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


##################
# Error Handling #
##################

def rescue_all
  # NB Don't ever do this!
  # all methods are implicitly wrapped in begin/end block
  # if begin isn't specified, will rescue all errors from start of the method
  # declare begin/end explicitly when you know where the error might come up

  # begin
    0 / 0 # raises ZeroDivisionError
  rescue # rescues StandardErrors and all that inherit from it
    puts "Something went wrong!"
  # end
end

def rescue_specific

  # code after the error and before the rescue never runs
  begin
    0 / 0 # raise ZeroDivisionError
    [1, 2, 3].eac { |x| puts x }
  rescue ZeroDivisionError
    puts "Stop trying to divide by zero!"
  end
  # stuff after begin/end doesn't get executed if an error was rescued
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

# defines a custom error class that inherits from StandardError
class InvalidInputError < StandardError
  def message
    "You typed the wrong thing."
  end
end
#
class Game
  attr_accessor :attempts

  def initialize
    @attempts = 3
  end

  def run
    begin
      take_turn!
    # this syntax stores the error object in a variable
  rescue InvalidInputError => potato
      puts potato.message

      self.attempts -= 1
      # retry goes back to the top of our being/end loop
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
      raise InvalidInputError.new
    end
  end
end








"hi"
