class AddPublishDate < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :publish_date, :date, null: false
  end
end
