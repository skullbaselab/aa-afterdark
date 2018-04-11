class AddEmailsToDog < ActiveRecord::Migration
  def change
    add_column :dogs, :owner_email, :string
  end
end
