require 'byebug'

# def select_cat(cats)
#   cats.each do |cat|
#     return cat if cat == 'Sennacy'
#   end
#   # this return statement returns from select_cat, not just the block
#   # you can use lambdas to return early from the block instead of the whole method
#   "this will never show"
# end
#
# select_cat(['Markov', 'Sennacy'])

# Pass By Reference

# arr = ['ruby', 'is', 'great']
#
# arr.each do |string|
#   string << "!"
# end
#
# puts arr


# What IS Pass By Reference?
# we're only passing the reference around, not the actual value
# You can have multiple variables that reference the same value

# def do_block(&blk) # this method still expects 0 arguments
#   puts "about to call block"
#   # debugger
#   blk.call # preferred syntax for calling a block
#   yield
# end
#
# do_block { puts "hello from the block" }

# def do_proc # this method DOES expect an argument
#   puts "about to call proc"
#   # prc.call
#   yield
# end
#
# do_proc(Proc.new { puts "hello from the proc!" })


def do_proc_and_block(prc = nil, &blk)
  prc ||= Proc.new{ puts "default proc" }
  prc.call
  blk.call
  # yield # will only yield to blocks passed, not arguments
end

# do_proc_and_block(Proc.new { puts "hello from the proc!" }) do
#   puts "hello from the block"
# end


class TicTacToe

  attr_reader :board
  attr_accessor :player
  puts self
  # attr_accessor/reader/writer are just class methods that define new methods

  def self.in_bounds?(x, y)
    # class method
    # not particular to a specific instance
    x.between?(0, 2) && y.between?(0, 2)
  end

  def self.what_is_self?
    puts self
  end

  def initialize(player, board = Array.new(3) { Array.new(3) })
    @player = player
    @board = board
  end

  def what_is_self?
    puts self
  end

  def pos_empty?(x, y)
    # instance method
    # particular to this instance of TicTacToe
    board[x][y].nil?
  end

  def valid_move?(x, y)
    self.pos_empty?(x, y) && self.class.in_bounds?(x, y)
    # uses both an instance method and a class method
  end

  def reset_player!(player2)
    self.player = player2
    # use self to explicitly use the accessor
    # otherwise you'll just assign a local variable
    # you can use @, but it is less preferred for debugging
  end
end



# Prep notes

################## Pass By Reference #########################

name = "Joey" # "Joey"
name2 = "Joey" # "Joey"
name << " Primero"
name # "Joey Primero"
name2 # "Joey Primero"

name = "Joey" # "Joey"
name2 = "Joey" # "Joey"
name = name + " Primero"
name # "Joey Primero"
name2 # "Joey"


################## Array/Hash Defaults #########################

class FakeArray

  def initialize(length, default = nil, &prc)
    @contents = []
    length.times do
      if prc
        @contents.push(prc.call)
      else
        @contents.push(default)
      end
    end
  end

  def inspect
    @contents
  end

end
#
# copies = FakeArray.new(3, [])
# p copies.arr.map { |arr| arr.object_id }
#
# uniques = FakeArray.new(3) { [] }
# p uniques.arr.map { |arr| arr.object_id }


################## Procs and Blocks #########################

# do_block
# do_proc

def do_block(&blk)
  blk.call
end

def do_proc(prc)
  prc.call
end

def do_proc_and_block(prc, &blk)
  prc.call
  blk.call
end

# do_block { puts "Hello world! I'm from the block!" }
# do_proc(Proc.new { puts "Hello world! From the proc!" })
# do_proc_and_block(Proc.new { puts "Run me first!" }) do
#   puts "then run me!"
# end

################## Attr Accessors #########################

require "byebug"

class Dog
  # attr_reader :name
  # attr_accessor :color, :mood

  def initialize(name, color)
    @name = name
    @color = color
    @mood = "happy"
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def color
    @color
  end

  def color=(color)
    debugger
    @color = color
  end

  def mood
    @mood
  end

  def mood=(mood)
    @mood = mood
  end

  def get_bath
    # self.color = "white"
    # self.mood = "confused"
    color = "white"
    mood = "confused"
    debugger
  end

end

d = Dog.new("Bailey", "Brown")

d.name # "Bailey"
d.color # "White"
d.get_bath # "White"
d.color # ???


################## Class Methods #########################

class TicTacToe
  attr_accessor :board

  def self.in_bounds?(x, y)
    x.between?(0, 2) && y.between?(0, 2)
  end

  def self.won_board
    arr = Array.new(3) { Array.new(3) }
    arr[0][0] = "x"
    arr[1][0] = "x"
    arr[2][0] = "x"
    return TicTacToe.new(arr)
  end

  def initialize(board = Array.new(3) { Array.new(3) })
    @board = board
  end

  def pos_empty?(x, y)
    @board[x][y].nil?
  end

  def valid_move?(x, y)
    self.class.in_bounds?(x, y) && self.pos_empty?(x, y)
  end

  def render
    @board.each { |row| p row }
  end

end
