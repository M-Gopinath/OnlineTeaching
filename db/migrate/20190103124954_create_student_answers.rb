class CreateStudentAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :student_answers do |t|
      t.string :name
      t.integer :activity_question_id
      t.integer :user_id
      t.integer :activity_answer_id
      t.string :activity_answer_type

      t.timestamps
    end
  end
end
