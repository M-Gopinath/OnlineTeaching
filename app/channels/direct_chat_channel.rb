class DirectChatChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "direct_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def direct_chat_count(data)
    users = User.where(id: data['users'])
    data = []
    users.each do |u|
      data << [u.id, number_to_human(u.unread_direct_charts.count, :format => '%n%u', :units => { :thousand => 'K' }),u.unread_charts_notification_template]
    end
    ActionCable.server.broadcast "direct_chat_channel", message: data
  end
end
