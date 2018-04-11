class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
    
    # add index to foreign keys
    add_index :tweets, :author_id, unique: true
  end
end
