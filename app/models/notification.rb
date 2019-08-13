class Notification < ApplicationRecord
	belongs_to :notificable, polymorphic: true
  has_many :user_notifications, dependent: :destroy
  has_many :recipients, through: :user_notifications, source: :user
end
