class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :color
      t.integer :person_id

      t.timestamps null: false
    end
    add_index :cats, :person_id
  end
end
