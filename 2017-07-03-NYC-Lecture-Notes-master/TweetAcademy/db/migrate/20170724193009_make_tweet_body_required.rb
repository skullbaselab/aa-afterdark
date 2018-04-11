class MakeTweetBodyRequired < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :body
    add_column :tweets, :body, :string, null: false
  end
end
