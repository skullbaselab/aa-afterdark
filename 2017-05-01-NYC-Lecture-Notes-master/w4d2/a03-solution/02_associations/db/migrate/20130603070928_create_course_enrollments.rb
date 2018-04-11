class CreateCourseEnrollments < ActiveRecord::Migration
  def change
    create_table :course_enrollments do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
