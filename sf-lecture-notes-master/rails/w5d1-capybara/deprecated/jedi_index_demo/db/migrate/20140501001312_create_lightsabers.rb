class CreateLightsabers < ActiveRecord::Migration
  def change
    create_table :lightsabers do |t|
      t.string :color, null: false
      t.integer :jedi_id, null: false

      t.timestamps
    end
    add_index :lightsabers, :jedi_id
  end
end
