class AddIsReadToMessage < ActiveRecord::Migration[5.2]
  def change
  	add_column :chat_messages, :is_read, :boolean, default: false
  	add_column :enroll_course_messages, :is_read, :boolean, default: false
  end
end
