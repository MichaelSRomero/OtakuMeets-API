class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :user_a_id, foreign_key: true
      t.integer :user_b_id, foreign_key: true

      t.timestamps
    end
  end
end
