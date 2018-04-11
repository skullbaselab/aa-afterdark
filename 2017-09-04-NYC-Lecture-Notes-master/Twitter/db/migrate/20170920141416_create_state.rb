class CreateState < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.text :name, null: false 

      t.timestamps
    end
  end
end
