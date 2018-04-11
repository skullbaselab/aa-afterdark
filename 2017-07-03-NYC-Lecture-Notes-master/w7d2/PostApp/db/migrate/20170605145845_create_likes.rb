class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :post_id, null: false
      t.timestamps null: false
    end

    add_index :likes, :post_id
  end
end
