class ChatRoom < ApplicationRecord
  belongs_to :user, optional: true
  has_many :chat_messages, dependent: :destroy
end
