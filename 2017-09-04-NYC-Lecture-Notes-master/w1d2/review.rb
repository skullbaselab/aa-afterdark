require 'byebug'

# mutable:
# immutable:



# def iterate
#   ruby_love = ["I", "Love", "Ruby"]
#   ruby_love.each do |word|
#     debugger
#     word += "!"
#   end
# end
#
# ruby_love.map { |word| word += "!" }
#
# ruby_love.each { |word| word << "!" }
#
# ruby_love.map { |word| word << "!" }

##################
#Procs and Blocks#
##################
# & ampersand toggles from block to proc and proc to block.
# in method def, as arg, you can pass in a prc, with &, to toggle it to a block
# in method call you can also toggle with ampersand.
def do_block(&prc)

  # puts "hello from the do_block method"
  prc.call
  # using yield will yield to a block if not specified in argument list
  # using "if block_given?" also works!
end

do_block { puts "hello from the block, which is being called inside the do_block method, wow" }

def do_proc(prc)
  prc.call
end
new_proc = Proc.new { puts "hello from the proc!" }
do_proc(new_proc)


#########################
#Hash and Array Defaults#
#########################




#################################
#attr_accessor and class methods#
#################################

class Fish

  # if you dont need access to the variables
  # outside the class do not make attr_accessor
  attr_accessor :name, :lost

  # the above overwrites the two below methods

  # def name
  #   @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end

  def self.make_nemo
    Fish.new("nemo", random_state_of_being)
  end

  def initialize(name, lost)
    @name = name
    @lost = lost
  end

# the self in the method below is for being more explicit
# when using a writer method you need the self,
# if not you will be setting a new local var
  private

  def self.random_state_of_being
    [true, false].sample
  end

  def find
    puts lost
    self.lost = false
    # lost = false
    #puts lost
    # when calling (putsing) lost will first look in smaller scope (method)
    # and there is a local var called lost, so it will puts that.
    # if it doesnt find it in method scope it will look for lost in class scope
    # change lost to false
  end

end
