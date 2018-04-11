# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :string(255)
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ActiveRecord::Base
  belongs_to(
    :instructor,
    :class_name => 'Wizard',
    :foreign_key => :instructor_id,
    :primary_key => :id
  )
  has_many(
    :enrollments,
    :class_name => 'CourseEnrollment',
    :foreign_key => :course_id,
    :primary_key => :id
  )
  has_many(
    :students,
    :through => :enrollments,
    :source => :student
  )
  has_one(
    :school,
    :through => :instructor,
    :source => :school
  )
end

