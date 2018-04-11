class AddImageUrlToComments < ActiveRecord::Migration
  def change
    add_column :todo_comments, :image_url, :string
  end
end
