class CreateEnrollCourseMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :enroll_course_messages do |t|
      t.text :body
      t.integer :course_id
      t.integer :user_id
      t.integer :enroll_course_room_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
