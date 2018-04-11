class AddAuthorIdToTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :user_id
    add_column :tweets, :author_id, :integer, null: false
  end
end
