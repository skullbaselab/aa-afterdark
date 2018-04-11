class CreateFinalProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :final_projects do |t|
      t.integer :student_id, null: false
      t.integer :supervisor_id, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :final_projects, :student_id
    add_index :final_projects, :supervisor_id
  end
end
