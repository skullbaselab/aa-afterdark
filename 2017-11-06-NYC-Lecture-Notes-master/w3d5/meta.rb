# SCOPE
require 'byebug'

# The code inside the class body runs when the class is defined/loaded
class Pet
  teach_tricks :eat, :sleep, :drink
  def self.teach_tricks(*trick_names)
    # any arguments to the block for define_method become arguments when you actually call that method
    # you can put splats in the block, you can put default arguments, all that jazz
    trick_names.each do |trick_name|
      define_method(trick_name) do |argument = 1|
        puts "#{trick_name}ing" * argument
      end
    end
  end
end

class Dog < Pet
# self is the Dog class inside of the class body

# can't write self.define_method because define_method is a private class method
define_method(:bark) do
  puts "woof"
end


#🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥
teach_tricks :fetch, :sit

def method_missing(method_you_tried_to_call)
  if (method_you_tried_to_call == :greet )
    self.class.teach_trick(method_you_tried_to_call)
    self.send(method_you_tried_to_call)
  else
    super
  end
end

puts self
  def self.doggie_things
    # self in a class method is the actual class (eg. Dog)
    # classes are objects
    puts self
  end

  def who_am_i?
    # self in an instance method is the instance
    puts self
  end

  def initialize(name)
    @name = name
    @secret = "Cat in disguise"
  end


  private

  attr_reader :secret

  def tell_secret
    puts "My secret is: #{@secret}"
  end

  def juggle(num_pins)
    puts "juggling #{num_pins} pins"
  end

  def supertrick(&prc)
    puts "Powering up for supertrick!!!"
    puts "..."
    puts "..."
    prc.call
  end
end


class Fish < Pet

  teach_tricks :swim, :gurgle, :chill

  def initialize(name)
    @name = name
  end

end













"hey"
