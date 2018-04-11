class AddEmailColumnToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :email, :string
  end
end
