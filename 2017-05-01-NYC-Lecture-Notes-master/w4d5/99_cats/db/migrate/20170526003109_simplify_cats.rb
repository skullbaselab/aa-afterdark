class SimplifyCats < ActiveRecord::Migration
  def change
    remove_column :cats, :birth_date
    remove_column :cats, :sex
    remove_column :cats, :color
  end
end
