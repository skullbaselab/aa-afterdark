class RemoveTitle < ActiveRecord::Migration
  def change
    remove_column :images, :title
  end
end
