class CreateHashTags < ActiveRecord::Migration[5.1]
  def change
    create_table :hash_tags do |t|
      t.string :body, null: false
      t.timestamps
    end
  end
end
