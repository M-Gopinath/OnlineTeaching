class CreateActivityMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_messages do |t|
      t.text :body
      t.integer :lesson_id
      t.integer :user_id
      t.integer :activity_room_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
