class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :session_token, :string, null: false
    add_column :users, :password_digest, :string, null: false

    add_index :users, :session_token, unique: true
    add_index :users, :password_digest, unique: true
  end
end
