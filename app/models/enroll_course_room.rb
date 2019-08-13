class EnrollCourseRoom < ApplicationRecord
  belongs_to :course
  has_many :enroll_course_messages, dependent: :destroy
end
