class RemoveUserEmailFromDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :user_email
  end
end
