class CreateCourseChatAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :course_chat_attachments do |t|
      t.string :image
      t.integer :enroll_course_message_id
      t.string :audio
      t.string :video

      t.timestamps
    end
  end
end
