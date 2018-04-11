require 'byebug'

class Pet
  @@fur = "soft"
  # @agenda = "be loved"

  def self.create_tricks(*trick_names)
    trick_names.each do |name|
      define_method(name) do
        puts "#{name}ing"
        puts self
      end
    end
  end

  def method_missing(method_name, *args)
    if method_name == :treat
      puts "I would like a treat!!"
    else
      super
    end
  end

  def initialize(name)
    @name = name
  end

  def self.agenda
    @agenda ||= "#{self}'s take over the world"
  end

  def self.fur
    @@fur
  end

  def name
    @name
  end

end

class Dog < Pet
  # @agenda = 'have ears scratched'

  # puts self

  def self.doggie_things
    puts self
  end

  def method_missing(method_name, *args)
    if method_name == :hello
      puts "Hi from the Dog class"
    else
      super
    end
  end

  def wat_is_me
    puts self
  end

  # def sleep
  #   puts "sleeping"
  # end
  #
  # def eat
  #   puts "eating"
  # end
  #
  # def drink
  #   puts "drinking"
  # end

  create_tricks :sleep, :eat, :drink

  def self.create_trick(trick_name)
    define_method(trick_name) do
      puts "I am doing the #{trick_name}"
    end
  end

  define_method(:drool) do
    puts "I am a dog and I am drooling"
  end

  def follow_command(command)
    self.send(command)
  end

  def juggle(num_pins)
    puts "juggling #{num_pins} pins"
  end

  private

  def trick
    puts "BACK FLIP!!"
  end
end


class Fish < Pet
  # make lots of tricks

  self.create_tricks :swim, :touch_the_boat, :splash, :get_caught, :lose_self
end
