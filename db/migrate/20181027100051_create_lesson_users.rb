class CreateLessonUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_users do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
