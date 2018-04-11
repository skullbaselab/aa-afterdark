class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :secret_identity, null: false
      t.string :name, null: false
      t.integer :power_level, null: false
      t.timestamps null: false
    end
  end
end
