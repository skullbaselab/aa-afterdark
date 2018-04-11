class CreateTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :technologies do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :technologies, :name
  end
end
