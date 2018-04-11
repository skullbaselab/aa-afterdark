class CreateSwords < ActiveRecord::Migration
  def change
    create_table :swords do |t|
      t.integer :size
      t.integer :swordable_id, null: false
      t.string :swordable_type, null: false

      t.timestamps null: false
    end

    add_index :swords, [:swordable_id, :swordable_type]
  end
end
