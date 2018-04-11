class Dog

  def woof
    "woof"
  end

  def eat
    "I'm eating"
  end

  def roll_over
    "I can't"
  end
  puts "We're putting self"
  puts self
  # define_method is implicitly called on self (which is the class)
  # can't say self.define_method because it is a private method
  define_method(:sleep) do |length_of_time|
    "Z" * length_of_time
  end

  # same thing as above
  # def sleep(length_of_time)
  # end
  [:bark, :poop, :sit, :play, :think, :speak].each do |method_name|
    define_method(method_name) do
      method_name.to_s
    end
  end
end

luna = Dog.new
ella = Dog.new
bramble = Dog.new

# send does not care about privacy
# puts luna.send(:woof)
# puts luna.send(:eat)
# puts luna.send(:roll_over)

# DRY code
[:woof, :eat, :roll_over, :bark, :poop, :sit, :play, :think, :speak].each do |method_name|
  puts luna.send(method_name)
end

puts luna.send(:sleep, 40)

puts luna.send('foow'.reverse)
# puts luna.woof

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

sennacy = Cat.new
puts sennacy.purr
puts sennacy.lick
puts sennacy.jump
sennacy.woof
sennacy.friend
sennacy.dan
