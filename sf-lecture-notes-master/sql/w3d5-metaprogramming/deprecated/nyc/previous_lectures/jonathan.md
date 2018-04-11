# Metaprogramming
- send
  - actions
- Sym#to_proc
- define_method
  - learn skills
- class ivar
  - last_cat_made

# Steps

SEND
Animal class with methods (burp, sleep, cook)
Iterate through symbols and send them
Make a private and public method, send

DEFINE METHOD
Dog = Class.new
Instantiate one dog, show define_method #run
Outside, use send to call define method

SYMBOL TO PROC WITH SEND
Names as strings, map(&:upcase)
Show using send as upcase
Show using & upcase
Deff Symbol#my_to_proc

DEFINE METHOD POWER
Make Cat class use array of symbols to define methods
Write Animal::set_skills to generalize
Show usage in cat class

CLASS INSTANCE VARIABLES
Make Cat class with initialze name
Make all cats class method with instance variable
In initialize shovel self in method
Make cat instances
Show instance variable get and set


```ruby
class Animal
  def breathe
    "i can breathe"
  end

  def cook
    "i can cook"
  end

  def run
    "i can run"
  end
end


class Animal
  def story
    "my story"
  end

  private
  def secret
    "my secret"
  end
end


class Symbol
  def my_to_proc
    # self #=> symbol instance
    Proc.new { |obj| obj.send(self) }
  end
end




class Dog
  def bark
    "bark"
  end

  define_method(:woof) do
    "woof"
  end

  # def woof
  #   "woof"
  # end

  define_method(:say_hi_to) do |name|
    "hi #{name}"
  end

  # def say_hi_to(name)
  #   "hi #{name}"
  # end

end



class Cat
  # def meow
  #   "i can meow"
  # end
  #
  # def pur
  #   "i can pur"
  # end
  #
  # def sleep
  #   'i can sleep'
  # end
  #
  # def whatever
  #   'i can whatever'
  # end

  # def method2
  #   1 + 1
  # end
  #
  # 1 + 1
  # self #=> Cat class
  #
  # [:meow, :pur, :sleep, :whatever].each do |action|
  #   define_method(action) do
  #     "i can #{action}"
  #   end
  # end

  def self.make_actions(*actions)
    self # => class

    actions.each do |action|
      self # => class

      define_method(action) do
        "i can #{action}"
        self # => instance
      end
    end
  end

  # Cat.make_actions
  # self.make_actions
  # make_actions(:pur, :meow, :sleep, :run)

  make_actions :pur, :meow, :sleep, :run
  attr_accessor :name, :color, :age
end


class Cat
  def self.all_cats
    self # => Cat class
    @all_cats ||= []
  end

  def initialize(name)
    @name = name
    self # => Cat instance

    self.class.all_cats << self
  end
end
```
