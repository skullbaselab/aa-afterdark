class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false

      # Dont forget your timestamps! Good habit :)
      t.timestamps
    end
  end
end
