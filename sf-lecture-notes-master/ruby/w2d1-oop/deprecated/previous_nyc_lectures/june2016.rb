## W2D1 LECTURE NOTES


# Quick aside on Ruby's line-by-line nature:
#
class Animal
  Animal.make_animals
  # wouldn't work here because #make_animals isn't defined yet
  # (Ruby goes line by line)

  def self.make_animals
    [Animal.new, Animal.new]
  end

  def eat
    puts "yum"
    self.sleep
    # why will THIS work? because by the time we call #eat,
    # full class has been loaded and #sleep has been defined.
  end

  Animal.new.eat # wouldn't work because #eat calls #sleep and #sleep isn't defined yet.

  def sleep
    puts "zz"
  end

end

Animal.new.eat  # would work here !


# quick aside on requiring files:
# make a separate file for each class or module that you define.
  # in below examples, the Dog class requires the Animal class to be defined
  # so you'll have to require (or require_relative) the Animal class before you
  # start your Dog class def.
# `require_relative` will look in the directory we're in.
# `require` will look first in ruby gems, then through local files.
  # generally best to only use `require` for requiring gems.
  # use `require_relative` if you're looking for a file you've made.
# no need to use .rb extension because `require` is a Ruby thing and will only look for .rb
# good convention to make one master class that requires all subclasses, then just require that master.
  # e.g. 'pieces.rb' requires all kinds of piece files.


# Class methods v instance methods
#  instance methods: when method depends on state of particular instance
#  class methods: when it's always the same no matter which instance you're dealing with.
#    e.g.: default_grid method should be on Board class, since it's always the same.
#          but move_piece should be instance method since depends on particular board.


module Walkable

  def walk
    puts "walkin! step one. step two. repeat."
  end


end

class Animal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  # these methods will now be private in inheriting classes too.

  def eat
    puts "#{self.name} is eating things! yum"
  end

  def sleep
    puts "zz"
  end

end

class Dog < Animal

  def bark
    puts "woof!"
  end

end

class Cat < Animal

  def initialize(name)
    # super passes all args over by default
    # but let's be very specific!
    super(name)
  end

  def live
    meow
    eat
    sleep
  end

  # if/else version:
  # def encounters_cat(other_cat)
  #   # calling #friendly? on another cat; explicit receiver, and not `self`.
  #   # so #friendly? can't be private.
  #
  #   if other_cat.friendly?
  #     meow # calling #meow implicitly on self. will error out if we say self.meow explicitly!
  #   else
  #     hiss
  #   end
  # end

  # rescue/retry version:
  def encounters_cat(other_cat)
    begin
      other_cat.check_for_friendliness
      meow
    rescue CatError => e   # saving the particular CatError in a local variable e that we can then access.
      # be specific with which error you'll rescue (in this case, only CatError)
      # don't blindly rescue all errors, or you'll rescue actual code errors too.
      # e.g., if you typo a method call, you want that to actually raise an error so you'll know.

      puts e.message
      hiss

      retry # go back to the `begin` and try again!
    end
  end

  protected
  # can only call protected methods from within class.
  # for this example: only a cat can check if another cat is friendly.

  def check_for_friendliness
    raise CatError.new("this cat is not friendly")
  end

  def friendly?
    true
  end


  private
  # tells other developers that all the methods down here
  # are internal logic that shouldn't be called directly from outside the class.
  # e.g. #meow is only called from #live. can't call paprika.meow from outside.

  # the only possible receiver of these method calls is implicit `self`
  # will error out if we give it an explicit receiver, even if it's explicit `self`
  # (e.g. self.meow) unless it's an attr_writer

  def hiss
    puts "i do not like you."
  end

  def meow
    puts "meowww"
  end

end

class CatError < StandardError
  # gives our custom CatErrors the methods from the StandardError class, like #message
end



# What are modules?
  # Packaged-up functionality.
  # When you include a module, it's like you're copying + pasting
  # the methods into a class def.
  # like in the Matrix when Neo downloads the kung fu package to his brain.
  # class Neo
    # include KungFuAble
  # end
  # "I know kung fu."

  # `extend` makes module methods class methods in place they're extended.
  # `include` makes module methods instance methods in place they're included.

  # can't inherit from multiple classes, but can include multiple modules.


# Class Inheritance v Modules.
  # use class inheritance when it's an intuitive/ linear
    # inheritance relationship.
  # use modules when there are shared behaviors
    # among essentially unrelated classes.

module Pluggable
  def plug_in
    puts "plugged in! huzzah."
  end
end

class Robot
  include Walkable # makes walkable methods instance methods for Robot instances.
  extend Pluggable # makes module methods class methods for Robot class.
end

class Appliance
  include Pluggable
end



# and some fun stuff on classes and superclasses...

  # [4] pry(main)> napoleon.class
  # => Dog
  # [5] pry(main)> napoleon.class.class
  # => Class
  # [6] pry(main)> napoleon.class.superclass
  # => Animal
  # [7] pry(main)> napoleon.class.superclass.superclass
  # => Object
  # [8] pry(main)> napoleon.class.superclass.superclass.superclass
  # => BasicObject
  # [9] pry(main)> napoleon.class.superclass.superclass.superclass.superclass
  # => nil
  # [10] pry(main)> napoleon.class.superclass.superclass.superclass.superclass.class
  # => NilClass
  # [11] pry(main)> napoleon.class.superclass.superclass.superclass.superclass.class.superclass
  # => Object
  # [12] pry(main)> napoleon.class.superclass.superclass.superclass.superclass.class.superclass.superclass
  # => BasicObject
  # [13] pry(main)> napoleon.class.superclass.superclass.superclass.superclass.class.superclass.superclass.superclass
  # => nil
  # [14] pry(main)> napoleon.class.superclass.superclass.superclass.superclass.class.superclass.superclass.superclass.class
  # => NilClass




# class definition structure:

# require_relative 'filename'

# class Something

  # inclusion of modules

  # factory methods

  # class methods

  # initialize method

  # instance methods

  # protected methods

  # private methods

# end
