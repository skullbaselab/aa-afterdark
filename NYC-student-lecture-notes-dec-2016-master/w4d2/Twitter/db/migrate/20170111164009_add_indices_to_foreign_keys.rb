class AddIndicesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :users, :location_id
    add_index :tweets, :author_id
  end
end
