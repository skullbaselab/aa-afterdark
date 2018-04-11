class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
