class CreateCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :circles do |t|
      t.integer :circle_leader_id, null: false
      t.integer :pod_id, null: false

      t.timestamps
    end
    add_index :circles, :circle_leader_id
    add_index :circles, :pod_id
  end
end
