class CreateWands < ActiveRecord::Migration
  def change
    create_table :wands do |t|
      t.string :core_ingredient
      t.integer :owner_id

      t.timestamps
    end
  end
end
