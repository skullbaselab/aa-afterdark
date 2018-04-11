class AddUserIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer
    add_index :tweets, :user_id
  end
end
