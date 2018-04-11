# == Schema Information
#
# Table name: wizards
#
#  id         :integer          not null, primary key
#  fname      :string(255)
#  lname      :string(255)
#  house_id   :integer
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wizard < ActiveRecord::Base
  # For all
  belongs_to(
    :house,
    :class_name => 'House',
    :foreign_key => :house_id,
    :primary_key => :id
  )
  belongs_to(
    :school,
    :class_name => 'School',
    :foreign_key => :school_id,
    :primary_key => :id
  )
  has_one(
    :headmaster,
    :through => :school,
    :source => :headmaster
  )
  has_one(
    :wand,
    :class_name => 'Wand',
    :foreign_key => :owner_id,
    :primary_key => :id
  )

  # For students
  has_many(
    :course_enrollments,
    :class_name => 'CourseEnrollment',
    :foreign_key => :student_id,
    :primary_key => :id
  )
  has_many(
    :courses,
    :through => :course_enrollments,
    :source => :course
  )
  has_many(
    :instructors,
    :through => :courses,
    :source => :instructor
  )
  has_one(
    :house_master,
    :through => :house,
    :source => :master
  )

  # For instructors
  has_many(
    :taught_courses,
    :class_name => 'Course',
    :foreign_key => :instructor_id,
    :primary_key => :id
  )
  has_many(
    :students,
    :through => :taught_courses,
    :source => :students
  )
end
