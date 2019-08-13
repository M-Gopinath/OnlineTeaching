class CreateUserNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_notifications do |t|
      t.integer :user_id
      t.integer :notification_id
      t.date :read_at

      t.timestamps
    end
  end
end
