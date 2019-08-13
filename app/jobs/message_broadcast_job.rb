class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room_id}_channel", data: render_message(message), msg: message
  end
  private

  def render_message(message)
    MessagesController.render partial: 'chat_messages/chat_message', locals: {chat_message: message}
  end
end