class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", null: false
      t.integer "country_id", null: false
      
      t.timestamps
    end
  end
end
