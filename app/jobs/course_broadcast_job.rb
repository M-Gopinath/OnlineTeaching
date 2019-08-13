class CourseBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "enroll_course_chat_#{message.enroll_course_room.id}_channel", data: render_message(message), msg: message
  end
  private

  def render_message(message)
    Schools::EnrollCourseMessagesController.render partial: 'schools/enroll_course_messages/enroll_course_message', locals: {enroll_course_message: message}
  end
end
