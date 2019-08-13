class CreateLiveMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :live_messages do |t|
      t.text :body
      t.references :live_conversation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
