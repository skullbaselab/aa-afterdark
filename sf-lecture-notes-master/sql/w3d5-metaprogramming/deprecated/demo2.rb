class Animal
  def self.makes_noise(noise)
    define_method("#{noise}") { puts "#{noise}!!" }
  end
end

class Cow < Animal
  makes_noise :moo
end

class Dog < Animal
  makes_noise :bark
end

class Cat < Animal
  makes_noise :meow
end













# class Animal
#   private
#   # defines a `makes_noise` class method; a method that defines other
#   # methods is called a *macro*
#   def self.makes_noise(name)
#     # When an Animal subclass calls `makes_noise`, we will
#     # *dynamically* define a new method on the
#     # subclass. `Class#define_method` is an instance method of the
#     # `Class` class.
#     puts self
#     define_method(name) do
#       puts self
#       puts "#{name}!"
#     end

#     nil
#   end
# end