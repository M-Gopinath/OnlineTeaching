class CreateEnrollCourseRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :enroll_course_rooms do |t|
      t.string :title
      t.integer :course_id

      t.timestamps
    end
  end
end
