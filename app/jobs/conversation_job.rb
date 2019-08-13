class ConversationJob < ApplicationJob
  @queue = :conversation_log

  def self.perform(user)
    # recipients = User.where(id: recipients)
    # conversation = user.send_message(recipients, body, subject).conversation
  end

  def self.scheduled(time, job, user, ids, body, subject, subdomain)
    Apartment::Tenant.switch(subdomain) do
      user = User.find(user['id'])
      recipients = User.where(id: ids)
      p conversation = user.send_message(recipients, body, subject).conversation
      data = []
      recipients.each do |u|
        count = u.mailbox.inbox(:unread => true).count
        data << [u.id, count, u.unread_mailbox_template]
      end
      ActionCable.server.broadcast "mail_chat_channel", message: data
    end
  end
end
