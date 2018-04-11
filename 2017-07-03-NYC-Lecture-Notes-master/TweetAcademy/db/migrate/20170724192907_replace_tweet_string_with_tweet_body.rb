class ReplaceTweetStringWithTweetBody < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :string
    add_column :tweets, :body, :string
  end
end
