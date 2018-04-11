# SCOPE

require 'byebug'

class Pet
  def self.create_tricks(*trick_names)
    trick_names.each do |name|
      define_method(name) do
        puts "I am " + name.to_s + "ing"
      end
    end
  end
end

class Dog < Pet

  create_tricks(:prance, :fetch, :sniff, :code)



  # puts self
    # self = Dog class
    # ruby code in the class body outside a method will run as soon
    # as the file is read by ruby.


  def self.doggie_things
    puts self
    # self = Dog class
  end
  # 
  # def bark
  #   puts self
  #   # self = instance of Dog
  # end

  def initialize(name)
    @name = name
  end

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

  # method_names = [:sleep, :eat, :drink, :poop, :play]
  #
  # self = Dog class

  define_method(:sleep) do
    puts "sleeping"
  end


  def self.create_trick(trick_name)
    debugger #self = Dog class
    self.define_method(trick_name) do
      debugger #self = instance of Dog ('Floyd')
      puts trick_name.to_s + "ing"
    end
  end

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

# Dog.doggie_things
# Dog.new.bark


class Fish < Pet

  create_tricks :swim, :gurgle, :do_nothing_really

  # Wow! This looks a lot like:
    # attr_reader :name
    # belongs_to :thing

  def initialize(name)
    @name = name
  end



end
