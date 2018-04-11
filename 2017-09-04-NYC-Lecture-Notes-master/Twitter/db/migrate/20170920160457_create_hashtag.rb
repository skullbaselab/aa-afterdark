class CreateHashtag < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags do |t|
      t.text :slogan, null: false
      t.timestamps 
    end
  end
end
