module LiveMessagesHelper
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end

  def message_interlocutor(message)
    message.user == message.live_conversation.sender ? message.live_conversation.sender : message.live_conversation.recipient
  end

  def get_chat_room
    ChatRoom.last
  end
end
