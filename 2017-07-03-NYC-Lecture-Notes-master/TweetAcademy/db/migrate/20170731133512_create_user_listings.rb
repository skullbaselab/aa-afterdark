class CreateUserListings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_listings do |t|
      t.integer :user_id, null: false
      t.integer :list_id, null: false

      t.timestamps
    end

    add_index :user_listings, [:user_id, :list_id], unique: true

  end
end
