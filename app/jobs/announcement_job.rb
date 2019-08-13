class AnnouncementJob < ApplicationJob
  @queue = :announcement_log

  def self.scheduled(time, job, user, ids, body, subject, subdomain)
    Apartment::Tenant.switch(subdomain) do
      user = User.find(user['id'])
      recipients = User.where(id: ids)
      conversation = user.send_message(recipients, body, subject).conversation
    end
  end
end
