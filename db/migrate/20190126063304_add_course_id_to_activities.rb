class AddCourseIdToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_questions, :course_id, :integer
    add_column :student_answers, :course_id, :integer
  end
end
