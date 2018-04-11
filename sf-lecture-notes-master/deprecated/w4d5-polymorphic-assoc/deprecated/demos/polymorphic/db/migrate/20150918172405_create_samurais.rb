class CreateSamurais < ActiveRecord::Migration
  def change
    create_table :samurais do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
