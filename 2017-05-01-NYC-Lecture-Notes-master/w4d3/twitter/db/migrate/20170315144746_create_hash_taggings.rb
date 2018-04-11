class CreateHashTaggings < ActiveRecord::Migration
  def change
    create_table :hash_taggings do |t|
      t.integer :tweet_id
      t.integer :hash_tag_id

      t.timestamps
    end
  end
end
