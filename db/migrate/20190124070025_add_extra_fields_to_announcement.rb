class AddExtraFieldsToAnnouncement < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :title, :string
    add_column :announcements, :is_public, :boolean
    add_column :announcements, :to_whom, :string
    change_column :announcements, :message, :text, using: "message::text"
  end
end
