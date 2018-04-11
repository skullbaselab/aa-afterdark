class AddOrderNumToComments < ActiveRecord::Migration
  def change
    add_column :todo_comments, :order_num, :float

    TodoComment.find_each do |comment|
      comment.order_num = comment.id
      comment.save!
    end

    change_column :todo_comments, :order_num, :float, :null => false
  end
end
