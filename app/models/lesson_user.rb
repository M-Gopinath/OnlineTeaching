class LessonUser < ApplicationRecord
  belongs_to :lesson, optional: true
  belongs_to :user, optional: true
end
