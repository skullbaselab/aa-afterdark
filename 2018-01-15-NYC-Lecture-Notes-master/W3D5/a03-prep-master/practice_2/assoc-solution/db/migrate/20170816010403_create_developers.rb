class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.integer :student_pod_id
      t.integer :student_circle_id
      t.string :name, null: false

      t.timestamps
    end
    add_index :developers, :student_pod_id
  end
end
