# **PASS BY REFERENCE**

# mutable data types: Array, String, Hash, Set
# immutable data types: Fixnum, Float, Symbol

ruby_love = ["I", "love", "Ruby"]

ruby_love.each do |word|
  # word += "!" # creates new object whose reference is lost after exiting block
  # word = word + "!"

  # shovel mutates the existing String object (no reassignment)
  # word = word << "!"

  # actually mutates element in array
  word << "!"
end

# **ARRAY/HASH DEFAULTS**

# Incorrect, each index shares same reference
# arr = Array.new(3, [])

# Correct! creates new object for each index
arr = Array.new(3) { [] }

# creates single array Object which is used as default value
my_hash = Hash.new([])
my_hash[:a] << 1
p my_hash[:b] # => 1 # all default values use same array reference


# **PROCS AND BLOCKS**

# block: encapsulated piece of ruby code
# proc: a block with a name

def do_block(&blk) # '&' is 'procifying' block
  # readable (preferable to 'yield')
  blk.call("doing the block")
  # calls 'blk' without direct reference (implicit)
  # yield
end

do_block do |arg|
  puts arg
end
#
def do_proc(prc)
  prc.call
end

prc = Proc.new { |arg| puts arg }
do_proc(prc)
#

def do_proc_then_block(prc = nil, &blk) # if no default prc value given, get argument exception
  prc ||= Proc.new { puts 'I be a default proc' } # if prc == nil, create new proc and assign to prc
  prc.call
  blk.call
end

# **CLASS METHODS**

class Dog
  attr_accessor :name # creates getter, setter methods
  # attr_accessor equivalent to attr_reader & attr_writer

  # 'Factory method' - generates new instances of the class
  # ex. Dog.create_a_pup
  def self.create_a_pup
    Dog.new('Leela')
  end

  def initialize(name)
    @name = name # typical instance var initialization
    # self.name = name # this also works, but is non-standard
  end

  # # getter method equivalent to attr_reader
  # def name
  #   @name
  # end
  #
  # # setter method equivalent to attr_writer
  # def name=(new_name)
  #   @name = new_name
  #   # @nmae = new_name # creates new instance variable
  # end

  def print_name
    # calls self.name implicitly
    puts name
  end

  def overwrite_name
    # name = 'Spot' # creates new local variable of 'Spot'
    self.name = 'Spot' # uses attr_accessor setter method
  end
end

# leela = Dog.create_a_pup

# gusto = Dog.new('Gusto')

# if __FILE__ == $PROGRAM_NAME
  if ARGV.shift == 'pry'
    require 'pry'
    pry
  end
# end
