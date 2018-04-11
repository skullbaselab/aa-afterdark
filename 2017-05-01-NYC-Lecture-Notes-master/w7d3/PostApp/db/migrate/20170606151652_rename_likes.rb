class RenameLikes < ActiveRecord::Migration
  def change
    rename_column :posts, :likes, :like_count
  end
end
