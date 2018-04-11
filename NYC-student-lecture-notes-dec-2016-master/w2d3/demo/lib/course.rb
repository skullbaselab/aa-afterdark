class Course
  attr_reader :students, :class_size

  def initialize(class_size)
    @class_size = class_size
    @students = []
  end

  def at_capacity?
    students.length == class_size
  end

  def add_student(student)
    unless at_capacity?
      @students << student
    end
  end

end
