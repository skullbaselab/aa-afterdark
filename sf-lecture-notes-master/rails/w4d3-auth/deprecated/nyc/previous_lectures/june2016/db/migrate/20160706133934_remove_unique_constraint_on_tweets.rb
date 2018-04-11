class RemoveUniqueConstraintOnTweets < ActiveRecord::Migration
  def change
    remove_index :tweets, :author_id
    add_index :tweets, :author_id
  end
end
