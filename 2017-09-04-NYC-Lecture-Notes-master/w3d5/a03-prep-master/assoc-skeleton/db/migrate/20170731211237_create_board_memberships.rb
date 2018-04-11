class CreateBoardMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :board_memberships do |t|
      t.integer :member_id
      t.integer :board_id

      t.timestamps
    end
    add_index :board_memberships, :member_id
    add_index :board_memberships, :board_id
  end
end
