class CreateActivityRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_rooms do |t|
      t.string :title
      t.integer :lesson_id
      t.string :activity_type
      t.integer :activity_id

      t.timestamps
    end
  end
end
