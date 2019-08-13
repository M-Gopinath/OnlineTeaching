class CreateEventAttendeeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendee_groups do |t|
      t.string :name
      t.string :description
      t.string :user_id
      t.string :is_active

      t.timestamps
    end
  end
end
