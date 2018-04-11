class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.integer :company_id
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.date :price_date

      t.timestamps
    end
    add_index :prices, :company_id
  end
end
