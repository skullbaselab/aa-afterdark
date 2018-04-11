require 'byebug'

num_arr = [1, 2, 3]

num_arr.each do |num|
  num**3
end

num_arr.map do |num|
  num**3
end


this_arr = ["Wooop", "There", "It", "Is"]

this_arr.each do |word|
  word += "!"
end

this_arr.map do |word|
  word << "!"
end


# my my my
def do_block(&blk) # make proc from block, block still exists
  # blk ||= Proc.new { puts 'hi' } # default proc example
  # blk = blk || Proc.new.....
  #        ^^ if blk is nil then we will assign blk to Proc.new....
  puts "hello from the do_block method"

  # debugger
  blk.call # actually a proc
  # yield is not preferred because blk.call is much clearer
end

do_block { puts "hello from the block, which is being called inside the do_block method, wow" }

def do_proc(prc)
  prc.call
  # yield won't work b/c there was no block passed to method
end

do_proc(Proc.new { puts "hello from the proc!" })
#       ^^make a new proc      ^^using this block

class Array
  def puts_array_then_does_each(&prc) # "procify" block
    puts self
    each(&prc) # "blockify" proc which we created on line 48
      # each expects a block, not a proc
  end
end

class Fish

  attr_reader :name
  attr_accessor :lost

  # class factory method to create new instance of Fish class
  def self.make_random_fish
    # self here is Fish class (not instance of Fish class)
    debugger
    name = ""
    5.times do
      name << ('a'..'z').to_a.sample
    end
    new(name, [true, false].sample) # implicitly self.new, self is Fish class
  end

  def initialize(name, lost)
    @name = name
    @lost = lost
  end

  def swim
    # self is specific instance instance of Fish
    puts "#{name} is swimming"
  end

  # def change_name_through_very_formal_process(name, secret_code)
  #
  # end

end


class Array
  def my_each(&prc) # takes a block and changes it to a proc with '&' operator
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
