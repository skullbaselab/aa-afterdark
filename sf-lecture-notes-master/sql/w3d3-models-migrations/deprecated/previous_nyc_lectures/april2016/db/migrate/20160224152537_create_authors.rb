class CreateAuthors < ActiveRecord::Migration
  def change
    # first method: create
    create_table :authors do |t|
      # t methods accept symbol as first argument to name column,
      # and can also accept an options hash as last argument

      t.string :name, null: false
      t.integer :country_id, null: false

      t.timestamps null: false
    end
    # next meth9d: add_index
    add_index :authors, :country_id
  end
end
