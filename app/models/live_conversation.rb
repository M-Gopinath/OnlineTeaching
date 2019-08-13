class LiveConversation < ApplicationRecord
  belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'

  has_many :live_messages, dependent: :destroy

  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :involving, -> (user) do
    where("live_conversations.sender_id =? OR live_conversations.recipient_id =?",user.id,user.id)
  end

  scope :between, -> (sender_id,recipient_id) do
    where("(live_conversations.sender_id = ? AND live_conversations.recipient_id =?) OR (live_conversations.sender_id = ? AND live_conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
end
