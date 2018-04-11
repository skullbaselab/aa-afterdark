class RenameTweetsColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :twee_id, :tweet_id
  end
end
