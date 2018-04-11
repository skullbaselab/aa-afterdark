class Student
  attr_accessor :fname, :lname
  attr_reader :courses

  def initialize(fname, lname)
    @fname = fname
    @lname = lname
    @courses = []
  end

  def fullname
    "#{fname} #{lname}"
  end

  def enroll(course)
    courses << course unless course.at_capacity?
  end
end
