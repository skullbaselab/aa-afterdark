class CreatePirates < ActiveRecord::Migration
  def change
    create_table :pirates do |t|
      t.string :beard_photo

      t.timestamps
    end
  end
end
