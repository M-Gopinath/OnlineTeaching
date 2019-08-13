class LiveChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_chat_#{current_user.id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def received_data(data)
    ActionCable.server.broadcast "live_chat_#{data['sender_id']}_channel", message: data
    ActionCable.server.broadcast "live_chat_#{data['recipient_id']}_channel", message: data
  end
end