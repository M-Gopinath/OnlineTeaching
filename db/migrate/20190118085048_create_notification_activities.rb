class CreateNotificationActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_activities do |t|
      t.integer :user_id
      t.integer :notification_id

      t.timestamps
    end
  end
end
