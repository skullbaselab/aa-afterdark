class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    create_table :tweets do |t|
      t.string :body, null: false, limit: 140
      t.string :tweeter_id, null: false

      t.timestamps
    end
  end
end
