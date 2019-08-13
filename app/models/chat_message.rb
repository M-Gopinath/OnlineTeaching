class ChatMessage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :chat_room, optional: true
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  belongs_to :parent,  class_name: "ChatMessage", optional: true
  has_many   :replies, class_name: "ChatMessage", foreign_key: :parent_id, dependent: :destroy

  def timestamp
    created_at.strftime('%l:%M %p on %B %d %Y')
  end
end
