class LessonImage < ApplicationRecord
  belongs_to :lesson, optional: true
end
