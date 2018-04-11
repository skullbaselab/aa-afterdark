class CreateTeachingAssistantMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :teaching_assistant_memberships do |t|
      t.integer :teaching_assistant_id, null: false
      t.integer :pod_id, null: false

      t.timestamps
    end
    add_index :teaching_assistant_memberships, :teaching_assistant_id
    add_index :teaching_assistant_memberships, :pod_id
  end
end
