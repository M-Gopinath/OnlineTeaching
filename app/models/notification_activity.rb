class NotificationActivity < ApplicationRecord
	belongs_to :user
	belongs_to :announcement, class_name: "Announcement", foreign_key: "notification_id"
end
