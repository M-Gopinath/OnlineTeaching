class RenameIsActiveToEventAttendeeGroups < ActiveRecord::Migration[5.2]
  def self.up
    change_column :event_attendee_groups, :is_active, :boolean, using: "is_active::boolean"
  end

  def self.down
    change_column :event_attendee_groups, :is_active, :string
  end
end
