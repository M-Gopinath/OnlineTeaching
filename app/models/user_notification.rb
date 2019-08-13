class UserNotification < ApplicationRecord
	belongs_to :user
  belongs_to :notification
  scope :unread, ->{ where(read_at: nil) }

  def unread?
    read_at.nil?
  end
end
