class LessonVideo < ApplicationRecord
  belongs_to :lesson, optional: true
end
