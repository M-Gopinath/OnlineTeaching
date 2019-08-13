class ActivityMessage < ApplicationRecord
  belongs_to :lesson, optional: true
  belongs_to :activity_room, optional: true
  belongs_to :user, optional: true
  belongs_to :parent,  class_name: "ActivityMessage", optional: true
  has_many   :replies, class_name: "ActivityMessage", foreign_key: :parent_id, dependent: :destroy
  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
