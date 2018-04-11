# Success at App Academy does
require 'byebug'
# You can do it!


##############
# References #
##############
# mutable data types: Array, String, Hash, Set
# immutable data types: Fixnum, Float, Symbol

ruby_love = ["I", "love", "Ruby"]

ruby_love.each do |word|
  word += "!"
end

# 1) ruby_love == ?

ruby_love.each do |word|
  word << "!"
end

# 2) ruby_love == ?

ruby_love[0] = "You"

# 3) ruby_love == ?


###########################
# Array and Hash Defaults #
###########################

###### Array defaults ######

# immutable
arr = Array.new(40, nil)
arr[0] = "not nil"

arr = Array.new(40, :hello)
arr[0] = :goodbye

# mutable
arr = Array.new(40, [])
arr[0] << "minimalism"

arr = Array.new(40) { [] }
arr[0] << "We did it!"

###### Hash defaults ######

# immutable
h = Hash.new(0)
h[:new_key] += 1

# mutable
h = Hash.new([])
h[:some_key] << "oops!"
h[:some_other_key]

h = Hash.new { [] }
h[:lost] << "bye"

h = Hash.new { |hash, key| hash[key] = [] }
h[:yay] << "We did it!"


####################
# Procs and Blocks #
####################

def run_block(&blk)
  # What is blk?
  blk.call
end

run_block do
  puts "Hello from the block"
end

def run_proc(prc, name)
  # what is prc?
  prc.call(name)
end

my_proc = Proc.new { |name| puts "Hey, #{name} in the proc" }
run_proc(my_proc, "Ella")

def run_proc_and_block(prc = nil, &blk)
  prc ||= Proc.new { puts "If I only had a Proc" }
  prc.call
  blk.call("Napoleon")
end

run_proc_and_block(Proc.new { puts "Yet another proc" }) do |name|
  puts "#{name} is in the block"
end

run_proc_and_block(&my_proc)


###########
# Classes #
###########

class Dog
  def self.spot_factory(spots)
    # what is self?
    Array.new(spots) { Dog.new("Spot") }
  end

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def bark
    puts "#{@name} says wrrf"
  end

  def add_lastname!
    @name = "#{@neme} Barker"
  end
end


#########
# Style #
#########

variables_names = "snake_case"
CONSTANTS = "SCREAMING"
class ClassNamesCamelCase
end

###########################

# Don't use `for in` loops

for i in [1,2,3]
  puts i
end

puts i # eep! why is 3 still hanging around? scoping problem

[1,2,3].each do |j|
  puts j
end

puts j # -> NameError

###########################

(1..20).each{|i| i.times do |j| puts ((i/j*25)).to_s - " times, please " << [100,111,110,39,116/0].map(&:chr).join end }
