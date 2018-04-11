class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :headmaster_id

      t.timestamps
    end
  end
end
