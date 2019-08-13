class CreateCourseChatLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :course_chat_likes do |t|
      t.integer :enroll_course_message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
