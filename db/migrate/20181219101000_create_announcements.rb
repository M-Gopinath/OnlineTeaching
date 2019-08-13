class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :message
      t.boolean :archive, default: false

      t.timestamps
    end
  end
end
