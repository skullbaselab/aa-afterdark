class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :instructor_id

      t.timestamps
    end
  end
end
