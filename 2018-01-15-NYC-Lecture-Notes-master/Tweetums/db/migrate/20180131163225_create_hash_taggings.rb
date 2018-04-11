class CreateHashTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :hash_taggings do |t|
      t.integer :tweet_id, null: false
      t.integer :hash_tag_id, null: false
      t.timestamps
    end
  end
end
