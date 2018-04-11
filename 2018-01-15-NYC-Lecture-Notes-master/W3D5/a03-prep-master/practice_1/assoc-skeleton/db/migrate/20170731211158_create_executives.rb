class CreateExecutives < ActiveRecord::Migration[5.1]
  def change
    create_table :executives do |t|
      t.string :name

      t.timestamps
    end
  end
end
