class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
