class EventActivityChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "event_activity_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def event_message(data)
    event = Event.find_by(id: data['event'])
    users = event.event_users
    n = event.build_event_notification
    n.title = event.title
    n.note = event.description
    n.recipients << users
    n.save!
    event_notify = event.event_notification
    users = event_notify.user_notifications.collect(&:user_id).compact
    user_notify = event_notify.user_notifications.collect(&:id).compact

    read_user = event.event_notification.user_notifications.find_by(user_id: event.user_id)
    read_user.update_attributes(read_at: Time.now) if read_user.present?

    data = []
    event.event_users.each do |u|
      unread_events = u.unread_events
      data << [u.id, number_to_human(unread_events.count, :format => '%n%u', :units => { :thousand => 'K' }), u.unread_event_template]
    end
    ActionCable.server.broadcast "event_activity_channel", notification: event_notify, users: users, user_notifies: user_notify, notify_data: data
  end
end
