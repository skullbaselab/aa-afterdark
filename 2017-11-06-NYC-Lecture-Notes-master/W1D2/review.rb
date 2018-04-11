require 'byebug'
puts __FILE__

num_arr = [1, 2, 3]

num_arr.each { |num| num**3 }
# num_arr is still [1, 2, 3]
# returns [1,2,3]


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

num_arr.map { |num| num**3 }
  # num_arr is still [1, 2, 3]
  # returns [1, 8, 27]

string_arr = ["Wooop", "There", "It", "Is"]

# This is reassigning the word variable; original reference is not changing
string_arr.each { |word| word = word + "!" }

string_arr.map { |word| word += "!" }

# below modifies original
string_arr.each { |word| word << "!" }
# below modifies original
string_arr.map { |word| word << "!" }

# procs are ruby objects, with ids, you can call methods
# blocks are not!

# ampersand in the method signature - procifying a BLOCK
# ampersand in the method CALL - blockifying a PROC

def do_block(&blk)
  blk.call
end

# {} or do ... end is a BLOCK
do_block { puts "hello from the block, which is being called inside the do_block method, wow" }

# no ampersand, accepts a regular ruby argument
# blk, prc are conventional but you can use any variable name
def do_proc(prc)
  prc.call
end

do_proc(Proc.new { puts "hello from the proc!" })

class Array
  # in the method def, procifying a block
  def puts_array_then_does_each(&banana)
    puts self
    # below blockifying a proc
    self.each(&banana)
  end
end

class Fish

  attr_reader :name

  # attr_reader is creating below method
  # def name
  #   @name
  # end

  attr_accessor :lost


  def lost
    @lost
  end

  def lost=(arg)
    @lost = arg
  end


  def self.make_random_fish
    debugger
    name = ""
    5.times do
      name << ('a'..'z').to_a.sample
    end
    # here, self is the class itself (Fish) because this is a class method
    self.new(name, [true, false].sample)
  end

  def self.make_nemo
    # could do self.new here
    Fish.new("nemo", true)
  end

  def initialize(name, lost)
    # instance variables are available in all instance methods
    @name = name
    @lost = lost
  end

  def reverse_name
    # puts @name.reverse does the same as below
    puts self.name.reverse
  end


  def find
    # here (in an instance method), self is an instance of Fish
    # below two lines do the same thing
    self.lost = false
    # @lost = false

    # this is setting a local variable, not reassigning the Fish instance's @lost attribute.
    # lost = false

    # below calling the private method swim on self implicitly
    # can't be called explicitly(self.swim) because it's a private method
    swim
  end

  private


  def swim
    puts "#{name} is swimming"
  end

end
