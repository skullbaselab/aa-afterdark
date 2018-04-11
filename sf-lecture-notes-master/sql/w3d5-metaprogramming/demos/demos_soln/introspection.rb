require 'byebug'
require_relative 'attr_accessor_lite.rb'
# debugger
class Human
  # debugger
  ## we are using our own custom attr_accessor_lite
  attribute_accessor_lite :firstname, :lastname
  def initialize(firstname, lastname, age = 0)
    @firstname = firstname
    @lastname = lastname
    @age = age
  end

  def fullname
    # debugger
    "#{firstname} #{lastname}"
  end
  
  def age_1_yr
    @age += 1
  end
end

class Student < Human
  ## we are using our own custom attr_accessor_lite
  attribute_accessor_lite :age
  def initialize(firstname, lastname, age, grade)
    super(firstname, lastname, age)
    @grade = grade
  end

  def move_to_next_grade
    @grade += @grade
  end
end

# first fo the self
# me = Student.new('andres', 'alfaro', 15, 11)
# Student.ancestors
# Student.superclass.superclass
# Class.superclass ¯\_(ツ)_/¯

# me Vs. unbound_method instance vars
# me.instance_variables #=> []
# unbound_method.instance_variables #=> [:@firstname, :@lastname, :@age, :@grade]
# me.methods
# Student.instance_methods

# Instance methods Student Vs. Human
# Student.instance_methods(false) #=> [:move_to_next_grade]
# Human.instance_methods(false) #=> [:firstname, :lastname, :fullname, :age_1_yr]

# me.is_a?(Student) #=> true
# me.is_a?(Human) #=> true
# me.is_a?(Object) #=> true
# me.is_a?(Kernel) #=> true
# me.is_a?(BasicObject) #=> true
# me.is_a?(BasicSocket) #=> false
# me.kind_of?(BasicSocket) #=> false
# me.kind_of?(BasicObject) #=> true
