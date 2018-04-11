class ChangeUsers < ActiveRecord::Migration
  def change
    # made a mistake? Don't edit migrations, write a new one
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
  end
end
