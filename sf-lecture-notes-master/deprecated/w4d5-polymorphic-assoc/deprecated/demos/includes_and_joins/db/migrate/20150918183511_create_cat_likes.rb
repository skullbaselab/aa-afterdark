class CreateCatLikes < ActiveRecord::Migration
  def change
    create_table :cat_likes do |t|
      t.integer :user_id
      t.integer :cat_id

      t.timestamps null: false
    end
  end
end
