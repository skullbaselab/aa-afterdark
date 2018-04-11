class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :picture_url, null: false
      t.boolean :alive, null: false, default: true

      t.timestamps null: false
    end
  end
end
