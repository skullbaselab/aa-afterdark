class RemoveUsers < ActiveRecord::Migration[5.0]
  def change
    drop_table :users

    remove_column :todos, :user_id
  end
end
