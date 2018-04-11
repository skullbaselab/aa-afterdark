require 'byebug'

# SCOPE

class Pet
  # this instance variable is for the class
  # CLASS INSTANCE VARIABLES DO NOT GET INHERITED
  # @agenda = "be loved"
  self.instance_variable_set(:@agenda, "be loved")

  def self.make_instance_variable(name, value)
    self.instance_variable_set(name, value)
  end

  # CLASS VARIABLES DO GET INHERITED
  @@agenda = "sleep"

  # simple getter for a class instance variable
  def self.agenda
    debugger
    @agenda
  end


  # Create a bunch of tricks at once
  def self.create_tricks(*trick_names)
    trick_names.each do |trick|
      define_method(trick) do
        puts "#{trick}ing"
      end
    end

  end

  def method_missing(method_name)

    if method_name == :hello
      debugger
      puts "hello"
      self.class.send(:define_method, method_name) do
        puts "#{method_name}"
      end
      self.send(method_name)
    else
      super
    end
  end

  def initialize(name)
    # this instance variable is for the instance
    @name = name
  end

end

class Dog < Pet
  # self is the class inside of a class definition
  # and this runs as soon as we load the class
  puts self

  # CHANGES THE CLASS VARIABLE FOR THE PET CLASS ALSO
  @@agenda = "make that money"

  # CREATE TRICKS IS DOING ALL THE WORK OF THE COMMENTED OUT METHODS BELOW
  create_tricks(:sleep, :eat, :poop, :drink)

  # def sleep
  #   puts "sleeping"
  # end
  #
  # def eat
  #   puts "eating"
  # end
  #
  # def poop
  #   puts "pooping"
  # end
  #
  # def drink
  #   puts "drinking"
  # end

  def self.agenda
    @@agenda
  end

  def self.doggie_things
    # self is the class
    puts self
  end

  def wat_is_me
    # self is the instance
    puts self
  end



  # ruby goes through the inheritance chain looking for method_name
  # when it doesn't find it, ruby goes through the inheritance chain again
  # looking for method_missing

  def do_this_then_that(this, that)
    # calls the method referenced by this on self
    self.send(this)

    # IMPOSSIBLE. there is no method called "this"
    # self.this
    # calls the method referenced by that on self
    self.send(that)
  end

  # the splat turned all extra arguments into array
  def do_this_with_args(this, *args)
    
    # the splat split up my args array into separate arguments
    self.send(this, *args)
  end

  def self.create_trick(trick_name)
    # define_method is a class method
    # BUT THE METHOD YOU ARE MAKING BECOMES AN INSTANCE METHOD
    define_method("#{trick_name}extra") do |how_many, y_doe|
      # this line doesn't happen until i invoke trick_name on a dog instance
      puts "#{trick_name}ing" * how_many
      self.send(:juggle, how_many)
    end
  end

  # I CAN ACTUALLY CALL ALL THESE PRIVATE METHODS USING SEND
  private

  def trick
    puts "BACK FLIP!!"
  end

  def juggle(num_pins)
    puts "juggling #{num_pins} pins"
  end

  def supertrick(&prc)
    prc.call
  end
end


class Fish < Pet

end
