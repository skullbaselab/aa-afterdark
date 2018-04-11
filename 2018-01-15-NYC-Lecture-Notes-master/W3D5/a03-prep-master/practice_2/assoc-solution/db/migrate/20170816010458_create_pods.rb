class CreatePods < ActiveRecord::Migration[5.1]
  def change
    create_table :pods do |t|
      t.integer :pod_leader_id, null: false
      t.string :name, null: false
      t.integer :coolness_rating

      t.timestamps
    end
    add_index :pods, :pod_leader_id
  end
end
