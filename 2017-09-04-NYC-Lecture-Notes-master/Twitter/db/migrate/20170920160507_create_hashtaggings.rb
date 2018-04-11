class CreateHashtaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtaggings do |t|
      t.integer :tweet_id, null: false
      t.integer :hashtag_id, null: false

      t.timestamps
    end
    add_index :hashtaggings, :tweet_id
    add_index :hashtaggings, :hashtag_id
  end
end
