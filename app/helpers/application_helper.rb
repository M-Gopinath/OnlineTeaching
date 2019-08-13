module ApplicationHelper
  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
  def unread_messages_count
    # how to get the number of unread messages for the current user
    # using mailboxer
    mailbox.inbox(:unread => true).count
  end
  def online_status(user)
    user.online? ? "user-#{user.id} fa fa-circle text-success" : "user-#{user.id} fa fa-circle"
  end

  def only_for_admin_teacher
    user_signed_in? && current_user.admin_teacher?
  end
end
