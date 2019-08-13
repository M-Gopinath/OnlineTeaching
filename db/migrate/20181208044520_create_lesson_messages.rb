class CreateLessonMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_messages do |t|
      t.text :body
      t.integer :lesson_id
      t.integer :user_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
