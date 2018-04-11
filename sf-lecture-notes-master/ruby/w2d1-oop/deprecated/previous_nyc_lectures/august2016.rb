require 'byebug'

# NOTE: Started with just Cat class with initialize, eat, bite, chew, swallow
# 

class CatError < StandardError

end

module Walkable # naming convention => ends in -able
  NUM_LEGS = 10
  def walk
    debugger
    self.class::NUM_LEGS.times { puts "step step" }
    # num_legs.times { puts "step step" }
  end
end

module Mascotable
  def make_mascot
    name = self.to_s.capitalize + "ster"
    # debugger
    self.new(name, "red", 42)
  end
end


class Animal
  include Walkable # gives us instance methods when we include
  extend Mascotable # gives us class methods when we extend

  # NUM_LEGS = 4 # constants only available in the scope they're defined

  attr_reader :name, :color

  def initialize(name, color)
    @name, @color = name, color
  end

  def eat
    debugger
    begin
      bite
      chew
    rescue CatError => e # if bite raised an error, we skip chew
      puts e.message
      # retry # this puts us in a loop until we get good input
    end
    swallow # the rescue skips us straight to swallow

    # self.bite
    # self.chew
    # self.swallow
    # will it work if we explicitly call these methods on self?
    # NOPE - can only implicitly call private methods
  end

  private # everything below this will be private
  def bite
    # begin
      if name == "Sennacy"
        raise CatError.new("No! This hurts!")
      end
      puts "BITE"
    # rescue CatError => e # allows us to get the error but not break
    #   puts e.message
    # end
  end

  def chew
    puts "nom nom nom"
  end

  def swallow
    puts "gulp, burp, sigh"
  end
end

class Cat < Animal

  NUM_LEGS = 3

  def initialize(name, color, weight)
    # super # without specifying args, will pass all args
    super(name, color) # better to always specify args
    @weight = weight # if we had extra args for a child class, NEED to specify args in super
    2.times { meow }
  end

  def num_legs
    4 # because we care
  end

  def greet(other_cat)
    self.meow
    other_cat.meow
  end

  protected # can only be called within this class
  def meow
    puts "#{name} is meowing: meow"
  end

  # don't use the public keyword if you can help it
  # organize public methods, then protected, then private
end

class Dog < Animal # almost entirely the same as Cat

  def initialize(name, color)
    super(name, color)
    2.times { bark }
  end

  def bark
    puts "#{name} is barking: woof!"
  end

end


# if we need objects that are related and package both state and functionality,
# use classes and inheritance
# if you just need to bundle methods, use modules

class Robot

  NUM_LEGS = 2

  include Walkable
end
