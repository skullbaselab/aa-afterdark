require 'byebug'


def same_object?(obj1, obj2)
  obj1.object_id == obj2.object_id
end


class Array
  def my_each(&prc)
    i = 0

    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_map(&prc)
    mapped = []

    self.my_each do |el|
      mapped << prc.call(el)
    end

    mapped
  end
end

# mutable: strings, arrays, hashes
# immutable: integers, floats, symbols

# TEST YOUR KNOWLEDGE OF MUTABILITY
# num_arr = [1, 2, 3]
#
# num_arr.each { |num| num**3 }
#
# num_arr.map { |num| num**3 }
#
# string_arr = ["Wooop", "There", "It", "Is"]
#
# string_arr.each { |word| word = word + "!" }
#
# string_arr.map { |word| word += "!" }
#
# string_arr.each { |word| word << "!" }
#
# string_arr.map { |word| word << "!" }
#
# ampersand in method signature procifies a block
# blocks are not ruby objects. Proficifaction turns blocks into Proc objects
def do_thing(&blk)
  blk.call
end

# do_thing { puts "hello from the block, which is being called inside the do_block method, wow" }


def do_proc(prc, str)
  prc.call(str)
end

pro = Proc.new { |arg| puts "hello from the proc #{arg}!" }

# do_proc(pro, "congrats")

class Array
  # ampersand in method signature procifies a block
  def puts_array_then_does_each(&banana)
    puts self
    # ampersand in method definition blockifies a proc
    self.each(&banana)
  end
end

class Fish

  attr_reader :name

  # def name
  #   @name
  # end

  attr_accessor :lost, :color

  # def lost
  #   @lost
  # end
  #
  # def lost=(val)
  #   @lost = val
  # end

  # factory method is a method that makes a new instance of the class
  # self. infront of method name makes it a class method
  def self.make_random_fish
    # debugger
    name = ""
    # debugger
    5.times do
      name << ('a'..'z').to_a.sample
    end
    # debugger
    # inside of a class method, 'self' is the class itself
    self.new(name, [true, false].sample)
  end

  def self.make_nemo
    Fish.new("nemo", true)
  end

  def initialize(name, lost)
    @name = name
    @lost = lost
  end

# instance variables can be created anywhere
  def reverse_name
    # calling the name method
    self.name.reverse!
  end

  def put_color
    puts @color
    self.reverse_name
  end

  # instance variables that havent been referenced yet initialize to nil
  def test
    puts @test
  end

  def find
    #if 'self' omitted, creates a local variable instead of calling the method
    self.lost = false
  end


end












"hi"
