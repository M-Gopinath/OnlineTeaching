class ActivityRoom < ApplicationRecord
  belongs_to :activity, polymorphic: true, optional: true
  belongs_to :lesson, optional: true
  has_many :activity_messages, dependent: :destroy
end
