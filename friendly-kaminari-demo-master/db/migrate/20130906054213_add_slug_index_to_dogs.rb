class AddSlugIndexToDogs < ActiveRecord::Migration
  def change
  end

  add_index :dogs, :slug, unique: true
end
