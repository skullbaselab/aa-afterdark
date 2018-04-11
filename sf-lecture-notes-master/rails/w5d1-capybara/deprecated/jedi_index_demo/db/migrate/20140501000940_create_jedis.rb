class CreateJedis < ActiveRecord::Migration
  def change
    create_table :jedis do |t|
      t.string :name, null: false
      t.boolean :darkside, null: false, default: false
      t.boolean :master, null: false, default: false

      t.timestamps
    end
    add_index :jedis, :name, unique: true
  end
end
