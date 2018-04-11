class FixTweeterIdColumn < ActiveRecord::Migration[5.0]
  def change
    drop_table :tweets

    create_table :tweets do |t|
      t.string :body, null: false, limit: 140
      t.integer :tweeter_id, null: false

      t.timestamps
    end
  end
end
