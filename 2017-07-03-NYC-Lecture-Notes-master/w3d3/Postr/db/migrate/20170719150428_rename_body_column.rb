class RenameBodyColumn < ActiveRecord::Migration
  def change
    rename_column :posts, :bodiee, :body
  end
end
