class LiveMessage < ApplicationRecord
  belongs_to :live_conversation, optional: true
  belongs_to :user, optional: true
  validates_presence_of :body, :live_conversation_id, :user_id

  def receiver
    if live_conversation.sender == live_conversation.recipient || live_conversation.recipient == user
      live_conversation.sender
    else
      live_conversation.recipient
    end
  end
end
