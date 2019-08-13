class NotificationChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "notification_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def message_count(type)
    users = User.all
    data = []
    users.each do |u|
      data << [u.id, number_to_human(u.unread_announcements.count, :format => '%n%u', :units => { :thousand => 'K' }),u.unread_announment_template]
    end
    ActionCable.server.broadcast "notification_channel", message: data
  end
end
