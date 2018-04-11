class AddAuthorToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :author_id, :integer, null: false
    add_index :tweets, :author_id
  end
end
