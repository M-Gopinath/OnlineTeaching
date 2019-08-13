class CourseChatChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "coruse_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def coruse_chat_count(data)
    message = EnrollCourseMessage.find_by(id: data['message_id'])
    course = message.course
    if course.present?
      users = course.users
      n = message.build_enroll_course_notification
      n.note = message.body
      n.recipients << users
      n.save!
      data = []
      read_user = message.enroll_course_notification.user_notifications.find_by(user_id: message.user_id)
      read_user.update_attributes(read_at: Time.now) if read_user.present?
      users.each do |u|
        data << [u.id, number_to_human(u.unread_direct_charts.count, :format => '%n%u', :units => { :thousand => 'K' }),u.unread_charts_notification_template]
      end
      ActionCable.server.broadcast "course_chat_channel", message: data
    end
  end
end
