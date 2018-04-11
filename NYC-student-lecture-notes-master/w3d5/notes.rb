# Predict the output!
class MyClass
  puts self # self = MyClass

  def self.my_class_method1
    puts self # self = MyClass
  end

  def MyClass.my_class_method2
    puts self # self = MyClass
  end

  def my_instance_method
    puts self # self = instance of MyClass
  end

end

def MyClass.my_class_method3
  puts self # self = MyClass
end

MyClass.my_class_method
x = MyClass.new
x.my_instance_method

#################### INSTANCE_VARIABLE_GET/SET #######################

class Corgi
  # no attr_accessors!

  def initialize(name)
    @name = name
  end

end

fred = Corgi.new("fred")
#u.name # Error! undefined method `name'
fred.instance_variable_get("@name")
fred.instance_variable_get(:@name)
fred.instance_variable_set("@color", "bread")
fred.instance_variable_get(:@color) # "rainbow"

#################### SEND #######################

class Corgi

  def initialize(name)
    @name = name
  end

  private

  def eat
    "nom nom"
  end

  def sleep
    "Zzzzzzzz"
  end

  def party(how_hard = 3)
    party_chars = ["!*$!"] * how_hard
    party_chars.join(" ")
  end

end

kitty = Corgi.new("kitty")

kitty.sleep # private method called!
kitty.send(:sleep) # Zzzzzz

class Corgi

  def random_activities
    puts "============"
    [:eat, :sleep, :party].shuffle.each do |activity|
      puts self.send(activity) # explicit self for clarity
    end
  end

end

kitty.random_activities
kitty.random_activities
kitty.random_activities

# Send with arguments
kitty.send(:party, 1) # '!*$!'

#################### DEFINE_METHOD #######################

# Find self again!

class MyClass
  puts self # self = MyClass

  # defines and instance method for this class
  # here, self is MyClass
  define_method(:my_meta_method) do
    # self is now an instance of MyClass
    puts self # instance of MyClass
  end

  # this is equivalent to:
  # def my_meta_method
  #   puts self
  # end
end

x = MyClass.new
x.my_meta_method

module MethodMaker

  def make_methods(*method_names, &prc)
    # prc ||= Proc.new do |arg|
    #   string = "#{method}!"
    #   string += " and #{arg}" if arg
    #   string
    # end
    cool_val = 'stapler'

    method_names.each do |method|
      define_method(method) do |arg = nil|
        string = "#{method}!"
        string += " and #{arg}" if arg
        string += " #{cool_val}"
        string
      end
    end
  end

end

class Corgi
  # def self.make_methods(*method_names)
  #   method_names.each do |method|
  #     define_method(method) do |arg = nil|
  #       string = "#{method}!"
  #       string += " and #{arg}" if arg
  #       string
  #     end
  #   end
  # end

  define_method(:name=) do |new_name|
    # self = instance of Corgi
    @name = new_name
  end


  extend MethodMaker
  # extend includes the modules methods as class methods

  make_methods :kick_butt, :chew_bubblegum

  # def kick_butt(arg = nil)
  #   ...
  # end
  #
  # def chew_bubblegum(arg = nil)
  #   ...
  # end
end

patrick = Corgi.new('Patrick')
patrick.kick_butt
patrick.kick_butt(patrick.chew_bubblegum)



############# INCLUDE VS EXTEND ####################

module MyModule

  def my_module_method
    "Extremely useful method"
  end

end

class MyIncludingClass
  # turns all the methods from MyModule into instance methods for MyIncludingClass
  include MyModule
end

class MyExtendingClass
  # turns all the methods from MyModule into class methods for MyExtendingClass
  extend MyModule
end

x = MyClass.new

puts MyIncludingClass.new.my_module_method
puts MyExtendingClass.my_module_method

class Corgi
end

c = Corgi.new

Corgi.instance_eval do # the instance is 'Corgi', an instance of class Class.
  def class_method
    "This method was defined on the Corgi class"
  end
end

Corgi.class_eval do # the instance is 'Corgi', an instance of class Class.
  def instance_method
    str = "This method was defined for corgi instances."
    str + " This is similar to opening up the body of the class"
  end

end

# class Corgi
#   def instance_method
#     ...
#   end
# end

c.instance_method

c.instance_eval do # the instance is 'Corgi', an instance of class Class.
  def single_instance_method
    "This method was defined just for this one single corgi!"
  end
end

c.single_instance_method
Corgi.new.single_instance_method

c.class_eval # error, can only be used on classes

class UndebuggableCorgi
  def method_missing(method_name, *args)
    if attributes[method_name]
      attributes[method_name]
    else
      super
    end
  end

  def attributes
    { name: 'Oscar', color: 'Orange' }
  end
end
