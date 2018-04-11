class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :name, null: false
      t.string :secret_identity, null: false
      t.integer :power, null: false

      t.timestamps null: false
    end
  end
end
