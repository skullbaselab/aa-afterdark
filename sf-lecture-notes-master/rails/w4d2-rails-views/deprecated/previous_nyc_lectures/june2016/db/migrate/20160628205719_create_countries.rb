class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, null: false

      t.timestamps null: false
      # creates created_at and updated_at columns
      # just always add timestamps. you might need them later
    end
  end
end
