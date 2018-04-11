class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :country_id
    end

    add_index :users, :country_id
  end
end
