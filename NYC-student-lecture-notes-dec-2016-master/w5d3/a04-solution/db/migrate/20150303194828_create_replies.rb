class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :tweet_id, null: false
      t.string :body, null: false

      t.timestamps
    end

    add_index :replies, :tweet_id
  end
end
