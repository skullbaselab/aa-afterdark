#########################
# PRIVATE AND PROTECTED # - Maintainability (Code clarity)
#########################
require 'byebug'
class Human
  attr_reader :name

  def initialize(name)
    @name = name
    @awesomeness = rand(10) + 1
  end

  def reveal_secret
    # calling the private method #secret implicitly
    secret
  end

  def change_name(new_name)
    # name= is a private method, so cannot be called explicitly on self
    # BUT attr_writers are special and can be called on self explicitly even when private
    # because otherwise you would be defining a local variable
    self.name = new_name
  end

  def matching_awesomeness?(other_human)
    # this method wouldn't work if #is_awesome was a private method
    # because #is_awesome is being called on an instance of Human (other_human) explicitly
    self.is_awesome? == other_human.is_awesome?
  end

# protected methods cannot be called outside of the class (except in child classes)
# can be called explicitly
  protected
  def is_awesome?
    @awesomeness > 5
  end

  private

  def secret
    puts "am alien"
  end

  def name=(new_name)
    @name = new_name
  end
end

class Monkey
  def initialize(name)
    @name = name
  end

  def owner_is_awesome?(owner)
    owner.is_awesome?
  end
end

###########################
# INHERITANCE AND MODULES # - DRY
###########################

class Animal

  def initialize(name)
    @name = name
    @stomach = []
  end

  def eat(food)
    @stomach << food
  end
  #
  # def walk
  #   puts "i'm walking along"
  # end

end

# modules are just sets of methods than can be included in any class
module Walkable
  def walk
    # self in here is whatever self is where the method is called
    puts "I'm walking"
  end
  # self out here is the module Walkable
end

class Dog < Animal
  include Walkable
  attr_reader :name, :stomach
  attr_reader :breed

  def initialize(name, breed)
    # have to pass super the name argument because calling it without arguments would pass both name and breed
    # BUT the parent class, Animal, expects just one argument (name) in initialize.
    super(name)
    @breed = breed
  end

  # def eat(food)
  #   # super here does whatever parent class's eat method does
  #   super(food)
  #   puts "i'm full"
  # end

  # def walk
  #   puts "i'm walkingg"
  # end

  def bark
    puts "bark bark"
  end

  protected
  def secret
    puts "i'm a cat"
  end
end

class Cat < Animal
  include Walkable
  attr_reader :name, :stomach

  def initialize(name)
    # name will be passed implicitly to super
    super
  end
  #
  # def eat(food)
  #   self.stomach << food
  # end
  #
  # def walk
  #   puts "i'm walking"
  # end

  def meow
    puts "meoww"
  end

  protected
  def secret
    puts "i'm a dog"
  end
end

class Fish < Animal
  attr_reader :name, :stomach

  def initialize(name)
    super
  end

  # def eat(food)
  #   self.stomach << food
  # end

  def swim
    puts "i'm swimming"
  end
end



##################
# Error Handling #
##################

# Control Flow

def rescue_all
  begin
    name
    # we didn't specify any specific kind of error, so this will catch any error
  rescue
    puts "i was rescued!"
  end
end

def rescue_specific
  begin
    user_input = gets.chomp.to_i
    user_input / 0
  rescue ZeroDivisionError
    puts "you tried to divide by 0"
    retry
  end
end

def rescue_with_ensure
  begin
    user_input = gets.chomp.to_i
    user_input / 0
  rescue NoMethodError
    puts "no method error"
  rescue ZeroDivisionError
    puts "you keep trying to divide by 0"
  ensure
    # this happens whether an error occurs or not
    puts "quit trying to divide by 0"
  end
end

#


class FizzyBuzzyError < Exception; end
class FizzError < FizzyBuzzyError
  def my_message
    return "fizz error"
  end
end
class BuzzError < FizzyBuzzyError; end
class FizzBuzzError < FizzyBuzzyError; end

def fizz_buzz(num)
  result = []
  i = 1
  until result.size == num
    begin
      if i % 5 == 0 && i % 3 == 0
        # instantiating a new error instance here to pass a message argument
        raise FizzBuzzError.new("fizzbuzz error")
      elsif i % 5 == 0
        raise BuzzError
      elsif i % 3 == 0
        raise FizzError
      end
      # "=> error" is giving a variable name to the error instance that was raised
      # so you can call methods on the error
    rescue FizzBuzzError => error
      result << error.message
    rescue BuzzError
      result << "buzz"
    rescue FizzError => error
      result << error.my_message
    else
      result << i
    ensure
      i += 1
    end
  end
  result
end

class GameError < StandardError
 end
class InvalidInputError < GameError
end

class Game
  attr_accessor :attempts

  def initialize
    @attempts = 3
  end

  def run
    # begin/end not needed here, since when we retry we want to start back
    # at the very beginning of this method, and all methods are implicitly
    # wrapped in begin/end
      take_turn!
    rescue InvalidInputError => error
      puts error.message

      self.attempts -= 1
      retry if attempts > 0

    puts "Game Over!"
  end

# bang method because it may raise an error
  def take_turn!
    validate_input(get_input)
  end

  def get_input
    puts "Type X"
    gets.chomp
  end

  def validate_input(input)
    if input != "X"
      # .new("message") here used to pass a specific, clear message for the user
      raise InvalidInputError.new("You didn't type X")
    end
  end
end
