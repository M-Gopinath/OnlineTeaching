class CreateStudentGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :student_grades do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :activity_type
      t.string :grade

      t.timestamps
    end
  end
end
