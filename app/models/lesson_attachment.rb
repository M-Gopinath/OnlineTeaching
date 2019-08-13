class LessonAttachment < ApplicationRecord
  belongs_to :lesson, optional: true
end
