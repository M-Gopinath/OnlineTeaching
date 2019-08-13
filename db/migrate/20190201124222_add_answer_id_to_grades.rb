class AddAnswerIdToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :student_grades, :student_answer_id, :integer
  end
end
