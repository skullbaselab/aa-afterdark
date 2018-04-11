# **PASS BY REFERENCE**

# ruby_love = ["I", "love", "Ruby"]
#
#
# ruby_love.each do |word|
#   # debugger
#   # word = word + "!"
#   # debugger
#
#   # word << "!"
#
#   # returns similarly to shovel
#   word.concat("!")
#
#
# end

# **ARRAY/HASH DEFAULTS**

# ok for immutable default values
# avoid this syntax with mutable default values
# arr = Array.new(3, 0)
#
# arr1 = Array.new(3) { [] }
#
# my_hash = Hash.new() { [] }
#
my_hash1 = Hash.new() { |h, k| h[k] = [] }
#
# my_hash2 = Hash.new(0)

# **PROCS AND BLOCKS**

# NOTE:  If you use an & in the method definition,
# you are telling the method to expect a block
# if no block is passed, calling .call will throw an error

def do_block(&blk)

  # both call & yield call the block.
  # strong preference to call. Allows for better readibility of code
  blk.call(10)

  # can also pass arguments to yield in the same way
  # as we pass to call...but again, yield is not preferred.
  # yield
end

# notice: no & in method definition arguments
# this method expects a proc
def do_proc(prc)
  prc.call
end

def do_proc(prc)
  prc ||= Proc.new{ puts 'hello!' }
  arr = [1, 2, 3]
  arr.map(&prc)
end

# **CLASS METHODS**

class Fish

  attr_reader :name


  # attr_accessor
  # defines our getter & setter methods for us (see below)
  # Avoid using instance variables outside of initial creation
  # (usually within initialize)
  #
  # def lost
  #   @lost
  # end
  #
  # def lost=(arg)
  #   @lost = arg
  # end

  attr_accessor :lost


  def self.make_random_fish
    letters = ('a'..'f').to_a
    self.new(letters.sample, false)
  end

  # Example of a non-factory class method.
  # pertains to Fish as a class, and not
  # necessarily an instance of a fish
  def self.colors
    ['red', 'green', 'indigo']
  end



  # Factory method: Class methods that create
  # new instances of that class.
  def self.make_nemo
    self.new("nemo", true)
  end


  def initialize(name, lost)
    @name = name
    @lost = lost
  end


  def find
    # omitting the 'self.' will create a new
    # local variable named lost.
    # @lost = false
    self.lost=(false)

    # typo below!! Well, how do they fail?
    @lostt = false # this fails us silently (bad)
    self.lostt= false # this fails saying no method error (good)
    swim
  end

  private
  def swim
    puts "#{name} is swimming"
  end

end

# if __FILE__ == $PROGRAM_NAME

# insert code here to be executed here. Not just loaded.

# end
