class EventJob < ApplicationJob
  @queue = :event_log

  def self.scheduled(time, job, user, ids, body, subject, subdomain)
    Apartment::Tenant.switch(subdomain) do
      user = User.find(user['id'])
      recipients = User.where(id: ids)
      p conversation = user.send_message(recipients, body, subject).conversation
    end
  end
end
