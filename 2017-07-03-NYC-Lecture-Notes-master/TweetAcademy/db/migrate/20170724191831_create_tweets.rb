class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :string, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
