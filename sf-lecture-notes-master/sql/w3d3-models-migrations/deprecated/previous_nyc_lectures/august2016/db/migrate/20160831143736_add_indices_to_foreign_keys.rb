class AddIndicesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :tweets, :author_id
    add_index :users, :country_id
    add_index :users, :username, unique: true
  end
end
