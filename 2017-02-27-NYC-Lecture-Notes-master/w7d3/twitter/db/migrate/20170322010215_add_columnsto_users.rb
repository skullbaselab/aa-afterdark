class AddColumnstoUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :name, false
    change_column_null :tweets, :body, false
    change_column_null :tweets, :user_id, false
    change_column_null :locations, :name, false
    change_column_null :hash_tags, :name, false
    change_column_null :hash_taggings, :tweet_id, false
    change_column_null :hash_taggings, :hash_tag_id, false
    add_column :users, :session_token, :string, null: false
    add_column :users, :password_digest, :string, null: false
  end
end
