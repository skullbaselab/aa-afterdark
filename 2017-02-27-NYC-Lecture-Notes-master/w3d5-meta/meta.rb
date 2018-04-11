class Dog

  @all_dogs = [] # only accessible in the class, not sub-classes
  @@alll_dogs = [] # this would be available to inherited classes

  def self.all_dogs
    @all_dogs
  end

  def self.doggie_stuff
    puts self
    puts @moniker # this is the class @moniker, which is not defined
  end

  def initialize(moniker)
    @moniker = moniker

    Dog.instance_variable_set(:@all_dogs,
      self.class.instance_variable_get(:@all_dogs) << self)

    @moniker = 'fred'
  end

  def woof
    "woof"
    puts self
    puts @moniker
  end

  def eat
    "I'm eating"
  end

  def roll_over
    "I can't"
  end
  puts "We're putting self"
  puts self


  private
  def dogeing
    puts "dogeing"
  end

  public
  # define_method is implicitly called on self (which is the class)
  # can't say self.define_method because it is a private method

  # NB define a method called sleep
  # def sleep(time)
  #   puts "Z" * time
  # end

  define_method(:sleep) do |time|
    puts "Z" * time
  end

  # Make list of things that dogs can do and define methods for them
  actions = [:bark, :bite, :wag, :sit, :play_dead, :die, :fetch]

  actions.each do |action|
    define_method(action) do
      puts "I am #{action}ing"
    end
  end



end


# NB use send to call many methods on an instance of Dog
actions = ["bark", :bite, :wag, :sit, :play_dead, :die, :fetch]

chloe = Dog.new('chloe')

actions.each do |action|
  chloe.send(action)
end

# NB Use send with arguments
chloe.send(:sleep, 20)

Dog.send(:define_method, :drink) do |much|
  puts "I am #{@moniker} and be #{much} drinking"
end

class Dog
  define_method(:drink) do |much|
    puts "I am #{@moniker} and be #{much} drinking"
  end
end

chloe = Dog.new('chloe')

chloe.drink(7000)
chloe.send(:dogeing)

puts chloe.methods

# NB Map stuff

class Array
  def my_map(&prc)
    mapped = []

    each do |el|
      mapped << prc.call(el)
    end

    mapped
  end
end

class Symbol
  def to_proc
    puts "I'm in my own method"
    Proc.new { |el| el.send(self) }
  end
end


class Animal

  def self.make_methods(*args)
    args.each do |method_name|
      define_method(method_name) do
        method_name.to_s
      end
    end
  end
end

class Cat < Animal

  make_methods :purr, :lick, :jump

  def method_missing(method_name)
    puts method_name
    puts "You never defined that method, #{method_name}"
  end
end
