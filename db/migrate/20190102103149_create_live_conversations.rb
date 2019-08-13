class CreateLiveConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :live_conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
    add_index :live_conversations, :sender_id
    add_index :live_conversations, :recipient_id
  end
end
