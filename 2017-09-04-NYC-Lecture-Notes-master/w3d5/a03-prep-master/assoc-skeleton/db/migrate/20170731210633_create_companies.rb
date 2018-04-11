class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.float :market_cap
      t.string :ticker_symbol
      t.integer :exchange_id

      t.timestamps
    end
    add_index :companies, :exchange_id
  end
end
