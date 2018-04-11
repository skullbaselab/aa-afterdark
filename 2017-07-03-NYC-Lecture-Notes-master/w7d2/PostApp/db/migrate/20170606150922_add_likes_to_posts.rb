class AddLikesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes, :integer
    drop_table :likes
  end
end
