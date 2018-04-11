class Dog
  def self.makes_sound(noise)
    define_method("#{noise}") do
      puts "#{noise}!!"
    end
  end
end

d = Dog.new

d.bark # Method missing

Dog.makes_sound("bark")
d.bark # bark!!



























# class Dog
#   # defines a class method that will define more methods; this is
#   # called a **macro**.

#   def self.makes_sound(name)
#     define_method(name) { puts "#{name}!" }
#   end

#   makes_sound(:woof)
#   makes_sound(:bark)
#   makes_sound(:grr)
# end

=begin
dog = Dog.new
dog.woof
dog.bark
dog.grr
dog.chewy # NoMethodError
Dog.makes_sound("chewy")
dog.chewy
=end