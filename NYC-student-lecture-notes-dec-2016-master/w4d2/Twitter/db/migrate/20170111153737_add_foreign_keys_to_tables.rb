class AddForeignKeysToTables < ActiveRecord::Migration
  def change
    add_column :users, :location_id, :integer, null: false, default: 1
    add_column :tweets, :author_id, :integer, null: false, default: 1
  end
end
