# Predict the output!
class MyClass
  # MyClass
  puts self

  def self.my_class_method
    # MyClass
    puts self
  end

  # same as the method above
  def MyClass.my_class_method
    # MyClass
    puts self
  end

  def my_instance_method
    # instance of MyClass (x)
    puts self
  end

end

def MyClass.my_class_method
  # MyClass
  puts self
end

MyClass.my_class_method
x = MyClass.new
x.my_instance_method

#################### INSTANCE_VARIABLE_GET/SET #######################

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
# symbols and strings both work but symbols are cool
u.instance_variable_set("@color", "rainbow")
u.instance_variable_get(:@color) # "rainbow"

#################### SEND #######################

class Unicorn

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
    party_string = ""
    how_hard.times { party_string += "🎉" }
    party_string
  end

end

u = Unicorn.new("Tony")

class Unicorn

  def random_activities
    puts "============"
    [:eat, :sleep, :party].shuffle.each do |activity|
      puts self.send(activity) # explicit self for clarity
    end
  end

end

u.random_activities
u.random_activities
u.random_activities

# Send with arguments
u.send(:party, 5) # "🎉🎉🎉🎉🎉"

#################### DEFINE_METHOD #######################

# Find self again!

class MyClass
  puts self

  # defines and instance method for this class
  # here, self is MyClass
  define_method(:my_meta_method) do
    # self is now an instance of MyClass
    puts self
  end

end

x = MyClass.new
x.my_meta_method

class MyClass

  def self.make_methods(*method_names)
    # self is MyClass
    method_names.each do |method|
      # self is MyClass
      define_method(method) do |arg|
        # self is instance of MyClass
        string = "#{method}!"
        # if arg
          string += " and #{arg}"
        # end
        string
      end
    end
  end

end

class Unicorn < MyClass
  make_methods :kick_butt, :chew_bubblegum
end

u = Unicorn.new
u.kick_butt
u.kick_butt(u.chew_bubblegum)



############# INCLUDE VS EXTEND ####################

module MyModule

  def my_module_method
    "Extremly useful method"
  end

end

class MyIncludingClass
  # turns all the methods from MyModule into instance methods for MyInlcludingClass
  include MyModule
end

class MyExtendingClass
  # turns all the methods from MyModule into class methods for MyExtendingClass
  extend MyModule
end

x = MyClass.new



puts MyIncludingClass.new.my_module_method
puts MyExtendingClass.my_module_method



# Questions on instance_eval and class_eval
prc = Proc.new do
  puts name
  var = some_complicated_method
end

puts x.name
var = x.some_complicated_method
# allows your run all the code in prc as if self was x
# same as the two lines above
x.instance_eval(prc)

corgi1 = Corgi.new("doofus")
prc = Proc.new { puts name }
corgi1.instance_eval {
  puts name
}
