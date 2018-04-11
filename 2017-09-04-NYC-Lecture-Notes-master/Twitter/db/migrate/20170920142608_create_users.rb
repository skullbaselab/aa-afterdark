class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :username, null: false
      t.integer :state_id, null: false

      t.timestamps
    end
  end
end
