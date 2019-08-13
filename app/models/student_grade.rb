class StudentGrade < ApplicationRecord
	belongs_to :user
  belongs_to :activity, polymorphic: true, optional: true
  belongs_to :student_answer, optional: true
end
