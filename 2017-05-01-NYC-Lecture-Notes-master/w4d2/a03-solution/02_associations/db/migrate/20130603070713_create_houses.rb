class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.string :building
      t.integer :master_id

      t.timestamps
    end
  end
end
