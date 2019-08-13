module NotesHelper
  def notify_path(notify, user_notify)
    case notify.notificable_type
    when "Event"
      "#{event_show_path(notify.notificable_id, user_notify.id)}"
    else
      "#"
    end
  end
end
