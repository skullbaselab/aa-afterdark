class CreateWatchListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :watch_list_items do |t|
      t.integer :company_id
      t.float :cost_basis
      t.float :return_basis
      t.date :start_date
      t.date :end_date
      t.integer :watch_list_id

      t.timestamps
    end
    add_index :watch_list_items, :company_id
    add_index :watch_list_items, :watch_list_id
  end
end
