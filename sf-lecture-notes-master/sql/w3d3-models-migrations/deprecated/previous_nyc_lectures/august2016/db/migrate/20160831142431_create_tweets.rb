class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
  end
end
