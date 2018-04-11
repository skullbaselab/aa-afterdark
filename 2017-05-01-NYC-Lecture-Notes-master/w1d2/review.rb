require 'byebug'

# mutable: strings, arrays, hashes
# immutable: integers, floats, symbols

# TEST YOUR KNOWLEDGE OF MUTABILITY
num_arr = [1, 2, 3]

num_arr.each { |num| num**3 }
  # num_arr is still [1, 2, 3]
  # returns [1,2,3]

num_arr.map { |num| num**3 }
  # num_arr is still [1, 2, 3]
  # returns [1, 8, 27]

string_arr = ["Wooop", "There", "It", "Is"]

string_arr.each { |word| word += "!" }

string_arr.map { |word| word += "!" }

string_arr.each { |word| word << "!" }

string_arr.map { |word| word << "!" }

# procs are ruby objects, with ids, you can call methods
# blocks are not!

# ampersand in the method signature - procifying a BLOCK
# ampersand in the method CALL - blockifying a PROC

def do_block(&foot)
  # this method is now expecting a BLOCK, not an argument (or a Proc)
  # Block is turned into Proc
  puts "hello from the do_block method"
  # blk is really a PROC right now
  foot.call
end

# {} or do ... end is a BLOCK
do_block { puts "hello from the block, which is being called inside the do_block method, wow" }

# no ampersand, accepts a regular ruby argument
# blk, prc are conventional but you can use any variable name
def do_proc(elbow)
  elbow.call
end

do_proc(Proc.new { puts "hello from the proc!" })

class Array
  def puts_array_then_does_each(&prc)
    puts self
    each(&prc)
  end
end

class Fish

  attr_reader :name
  # def name
  #   @name
  # end

  attr_accessor :lost
  # you can implicitly call lost
  # you cannot implicitly call lost=, must use self.lost
  #   even if lost= is a private method
  # def lost=(value)
  #   @lost = value
  # end
  #
  # def lost
  #   @lost
  # end


  def self.make_random_fish
    debugger
    name = ""
    5.times do
      name << ('a'..'z').to_a.sample
    end
    # self is the CLASS itself (Fish)
    self.new(name, [true, false].sample)
  end

  def self.make_nemo
    Fish.new("nemo", true)
  end

  def initialize(name, lost)
    @name = name
    @lost = lost
  end


  def find
    # self is the INSTANCE of the fish class
    self.lost = false
    # @lost = false <-- this is not Ruby convention, harder to debug

    swim
  end

  private
  def swim
    puts "#{name} is swimming"
  end

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
    #map! version: self = mapped
  end
end
