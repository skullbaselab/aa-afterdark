class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|

      t.timestamps null: false
    end
  end
end
