require 'byebug'

module Exploitable
  def promote(network, emoji)
    # respond_to? => does self have this method defined? Returns a boolean.
    unless self.respond_to?(:name)
      raise NotImplementedError.new("It didn't work. The class must define a name method")
    end
    puts "My name is #{name} and you're watching #{network}. #{emoji}"
  end

  def disney_promotion
    begin
      promote("Disney Channel", "🐭")
    rescue NotImplementedError => e
      # e now contains our error object
      # debugger
      puts e.message
    end
  end
end

class Dog
  # attr_reader :name

  # include Exploitable

  def initialize(name)
    @name = name
  end

  def introduction(person)
    puts "Hello, #{person}! My name is #{name}."
  end

  def bark
    puts "My name is #{name} and I'm barking at you."
  end

  def play
    puts "My name is #{name}, will you play with me?"
  end

  def display_name
    puts "#{name}"
  end

  def roll_over
    puts "My name is #{name} and I have no idea what you're talking about."
  end

  private
  attr_reader :name

end

class ChampionDog < Dog

  include Exploitable

  def initialize(name, num_titles)
    super(name)
    @num_titles = num_titles
  end

  def introduction(person)
    # Not passing any arguments results in automatically passing the
    # arguments from the surrounding method call. (person in this case)
    super
    puts "I've also won #{num_titles} championships at the Dog Games."
  end

  def hunt
    puts "My name is #{name} and I'm 1/64th wolf so you know I'm good at that."
  end

  def roll_over
    puts "My name is #{name} and I definitely know what you're talking about."
  end

  def win_title
    self.num_titles = num_titles + 1
  end

  private
  # private methods cannot be called explicitly => with 'something.' in
  # front of the method call.
  # Exception to rule: attr_accessor's (and attr_writer's) setter method requires 'self.'

  # What methods would we like to make private?
  # Any methods we want to use internally, but not let the user
  # have access to

  attr_accessor :num_titles
  # Remember: attr_accessor defines the methods below:
  # def num_titles
  #   @num_titles
  # end
  #
  # def num_titles=(value)
  #   @num_titles = value
  # end


end

class Human
  attr_reader :name

  include Exploitable

  def initialize(name)
    @name = name
  end


end
