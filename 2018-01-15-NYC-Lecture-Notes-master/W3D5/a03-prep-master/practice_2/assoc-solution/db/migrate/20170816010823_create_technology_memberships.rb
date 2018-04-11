class CreateTechnologyMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :technology_memberships do |t|
      t.integer :technology_id, null: false
      t.integer :final_project_id, null: false

      t.timestamps
    end
    add_index :technology_memberships, :technology_id
    add_index :technology_memberships, :final_project_id
  end
end
