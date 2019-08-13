class MailChatChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "mail_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def message_count(data)
    users = User.where(id: data['users'].split(","))
    data = []
    users.each do |u|
      count = u.mailbox.inbox(:unread => true).count
      data << [u.id, number_to_human(count, :format => '%n%u', :units => { :thousand => 'K' }), u.unread_mailbox_template]
    end
    ActionCable.server.broadcast "mail_chat_channel", message: data
  end
end
