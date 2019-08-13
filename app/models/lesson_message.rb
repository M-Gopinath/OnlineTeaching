class LessonMessage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :lesson, optional: true
  belongs_to :parent,  class_name: "LessonMessage", optional: true
  has_many   :replies, class_name: "LessonMessage", foreign_key: :parent_id, dependent: :destroy
  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
