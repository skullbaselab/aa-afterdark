require "byebug"
# Pass by Reference

ruby_love = ["I", "love", "Ruby"]

ruby_love.each do |word|
  word += "!"
  # creates a new local variable word and sets it equal to word + "!"
end

ruby_love.each do |word|
  word << "!"
  # modifies the word in memory
end


# conventions:
  # ? methods often return true or false
  # ! (bang) methods often mutate the original

# Array and Hash Defaults
a = Array.new(40, [])
a[0] << "minimalism"

b = Array.new(5, nil)
b[0] = "not nil"


c = Array.new(5, :hello)
c[0] = :goodbye

d = Array.new { [] }

###########

h = Hash.new([])
h["pups"] << "luna"

h # {} empty!
h["cats"] # ["luna"] oh no!
h # {} still empty

h = Hash.new { [] } # won't ever put anything into the hash

# use this for mutable default values
h = Hash.new { |hash, key| hash[key] = [] }

h_immutable_default = Hash.new(true)

# Blockify & Procify

# Blocks:
# some_method { }
#
# some_method do
#
# end

# blocks can't be passed around, procs can!

# prc = Proc.new { puts "Hi from the block!" }
# prc.call

# procify and blockify
def do_block(name, &blk) #procify a block (turn a block into a proc)
  raise "hell" unless block_given?
  # NOTE: future lecturers: avoid using error handling w1d2 lecture.
  blk.call(name)
end
# do_block { |name| puts "Hello again, #{name}!" }

def do_proc_then_block(prc) #pass in a proc
  prc.call("Luna")

  do_block("Dumbo", &prc) #blockify the proc (turn a proc into a block)
end

my_prc = Proc.new { |name| puts "Hello again, #{name}!" }

# call the method with a proc
do_proc_then_block(my_prc)

["Napln", "Tita", "Sennrcy"].each(&my_prc) # turn the proc into a block

# Class

class Dog
  # attr_reader :name
  # attr_writer :name
  attr_accessor :name

  def self.spot_factory
    # what is self here? -> the class Dog

    # factory methods return an instance of the class
    Dog.new("Spot")
  end

  def initialize(name)
    # @name instance variable is set to the name passed in
    @name = name
  end

  def bark
    puts "#{name} says wrrf"
  end

  # def name
  #   @name
  # end

  # def name=(new_name)
  #   @name = new_name
  # end

  def rename(new_name)
    name = new_name #creates a local variable name and set it to the variable new_name
    # does NOT call the name= method on self

    self.name = new_name #calls the name= method

    # what is self here? an instance of a Dog
  end

end

ella = Dog.new("Ella")
ella.bark
ella.name # calling a method explicitly on Ella
