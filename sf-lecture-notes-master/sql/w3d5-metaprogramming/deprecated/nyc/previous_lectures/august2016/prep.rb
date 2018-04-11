#################### METAPROGRAMMING #######################

# Let's start by taking a moment to quantify what a class is.
# Instances of a class are essentially two pieces,
# the instance variables, which are the state of the instance
# and the methods, which are the behaivor of the instance, based on their state.
# (these are shared amongst all instances)
# We also have class methods, which are behaivor of the entire group, agnostic of instance variables.

# Up to now, we've had static behaivor, (unchanging) and been content to simply modify state.
# Metaprogramming, is (among other things) going to allow use to modify behaivor ON THE FLY.
# You've seen this before, even if you didn't write it.
# How does rspec 'override' methods on classes you have written,
# and even make them return different things?
# How does rails make methods for us on the fly based on belongs_to or has_many?
# Let's find out!

#################### FIND SELF #######################

# Before we get started, let's make sure we understand what self is
# in all of these situations.

# Predict the output!
class MyClass
  puts self #MyClass

  def self.my_class_method
    puts self #MyClass
  end

  def MyClass.my_class_method
    puts self #MyClass
  end

  def my_instance_method
    puts self #instance
  end

end

MyClass.my_class_method
x = MyClass.new
x.my_instance_method

#################### INSTANCE_VARIABLE_GET/SET #######################

# Ruby has some nice ways of showing your intended use of methods and instance variables.
# We can create readers with no writers, public and protected methods,
# and generally indicat our intent by the way we structure our code.
# However, these 'restrictions' are samantic, and not hard rules.
# We can access the instance variables of any ruby object at any time if we like, reader or no.

class Unicorn
  # notice, no attr_accessors!

  def initialize(name)
    @name = name
  end

end

u = Unicorn.new("Sparkles")
#u.name # Error! undefined method `name'
u.instance_variable_get("@name")
u.instance_variable_get(:@name)
#symbols or strings will both work. Slight preference for symbols,
# all other things being equal (this is pretty much always true).

# We can also set instance variables. Even one's that don't exist yet.

u.instance_variable_set("@color", "rainbow")
u.instance_variable_get(:@color) # "rainbow"

# Well fine, but why do we even want to be able to do this?
# For now this is only interesting for testing (and it is very useful for that)
# but with a few more tools we can do some very exciting stuff with this.

#################### SEND #######################

class Chimera

  def initialize(name, num_heads = 3)
    @name = name
    @num_heads = num_heads
  end

  private

  def eat
    "nom nom"
  end

  def sleep
    "Zzzzzzzz"
  end

  def party(how_hard = 3)
    party_string = ""
    how_hard.times { party_string += "🎉" }
    party_string
  end

end

# For our example we have a simple class with a few methods.
# What they do isn't important right now.
# The first thing we're going to look at is the private methods.

c = Chimera.new("Tony")

# c.sleep # error!  private method `sleep' called
c.send(:sleep) #"Zzzzzzzz"

# Like magic! Are we hacking ruby? Nope, we're just using one of it's cool metaprogramming features.
# We can 'send' any object a method name and it will try to call the method of the same name.
# What kind of fun can we have with this?

class Chimera

  def random_activities
    puts "============"
    [:eat, :sleep, :party].shuffle.each do |activity|
      # whatever symbol 'activity' is, call the method of the same name.
      puts self.send(activity) # explicit self for clarity
    end
  end

end

c.random_activities
c.random_activities
c.random_activities

# If you're wondering 'can I send methods with arguments?', yes, you can!
# Just pass the arguments as successive args to send.
c.send(:party, 5) # "🎉🎉🎉🎉🎉"

###################### TO_PROC #######################

class Symbol
  def my_to_proc
    Proc.new { |object| object.send(self) }
  end
end


#################### DEFINE_METHOD #######################

# define_method is a method inherited from the class 'Class'.
# What it does, is take a method name (symbol or string), and a block.
# It then defines an instance method of the same name, that runs the code in the block
# and it runs the code of the block in the scope of the instance. What does that mean?
# first let's add one more example to our find self class.

class MyClass
  puts self #MyClass

  define_method(:my_meta_method) do
    puts self #instance
  end

end

class MyClass

  define_method(:my_meta_method) do |arg|
    puts "#{arg}"
  end

end

x = MyClass.new
x.my_meta_method

# What about arguments? Well since the block is effectively what will become the method,
# we just pass args to the block.

# It's worth noting that we're using class methods in a way we haven't seen before
# (at least without understanding it). Most of the time thus far we've always called
# class methods on the class explicity, either MyClass.method_name or self.class.methodName.
# We're now calling these same methods using an implicit 'self'
# since self within the class definition is the class.
# Some examples of this you may have seen are
# ActiveRecord `has_many`, and `belongs_to`. Or even the ever present `attr_accessors`

class MyClass

  define_method(:my_meta_method) do |arg|
    puts "#{arg}"
  end

end

x = MyClass.new
x.my_meta_method("Hello world!")


########### CLASS VARIABLES VS CLASS INSTANCE VARIABLES ###########

# The only difference between a class variable (@@var_name)
# and a class instance variable (@var_name), is inheritence.
# class variables will be inherited by child classes.
# Class instance variables, will not. You probably won't use either one very much.

############# INCLUDE VS EXTEND ####################

# What are these? The are more methods inherited from the class 'Class'.
# They allow use to take methods from a module, and 'copy' them into a class.
# If we use include, they will be copied as instance methods.
# If we use extend, they will be copied as class methods.

module MyModule

  def my_module_method
    "Extremly useful method"
  end

end

class MyIncludingClass
  include MyModule
end

class MyExtendingClass
  extend MyModule
end

puts MyIncludingClass.new.my_module_method
puts MyExtendingClass.my_module_method
