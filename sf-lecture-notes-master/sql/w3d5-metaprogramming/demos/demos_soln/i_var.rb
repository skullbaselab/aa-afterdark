require 'byebug'
class Human
  @human_var = 'from human'
  @@counter = 0
  def self.human_var
    @human_var
  end
  
  def self.counter
    @@counter
  end

  def counter
    @@counter
  end

  attr_reader :firstname, :lastname
  def initialize(firstname, lastname, age = 0)
    @firstname = firstname
    @lastname = lastname
    @age = age
    @@counter += 1
  end

  def fullname
    "#{firstname} #{lastname}"
  end
  
  def age_1_yr
    @age += 1
  end

  def counter
    @@counter
  end
end

class Student < Human
  def initialize(firstname, lastname, age, grade)
    super(firstname, lastname, age)
    @grade = grade
  end

  def move_to_next_grade
    @grade += @grade
  end
end
