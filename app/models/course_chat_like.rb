class CourseChatLike < ApplicationRecord
  belongs_to :enroll_course_message, optional: true
  belongs_to :user, optional: true
end
