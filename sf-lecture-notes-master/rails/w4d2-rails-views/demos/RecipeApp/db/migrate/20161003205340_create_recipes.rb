class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
    	t.string :name, null: false
    	t.integer :author_id, null: false
    	t.string :image_url, null: false
    	t.text :ingredients, null: false
    	t.text :description, null: false
    	t.text :directions, null: false
      t.timestamps
    end
  end
end
