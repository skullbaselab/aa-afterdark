class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.integer :company_id

      t.timestamps
    end
    add_index :boards, :company_id
  end
end
