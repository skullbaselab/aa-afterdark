class AddIndexToForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :state_id
    add_index :tweets, :author_id
  end
end
