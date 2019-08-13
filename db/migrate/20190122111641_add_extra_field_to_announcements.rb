class AddExtraFieldToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :important, :boolean, default: false
  end
end
