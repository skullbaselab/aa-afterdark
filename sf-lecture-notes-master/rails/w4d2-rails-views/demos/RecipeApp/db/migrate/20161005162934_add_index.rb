class AddIndex < ActiveRecord::Migration[5.0]
  def change
  	add_index :reviews, :recipe_id
  end
end
