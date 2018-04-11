class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :bodiee, null: false 
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
