class CourseRating < ApplicationRecord
  belongs_to :course, optional: true
end
