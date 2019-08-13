class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :note
      t.string :notificable_type
      t.integer :notificable_id
      t.string :type

      t.timestamps
    end
  end
end
