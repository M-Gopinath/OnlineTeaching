class LessonRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lesson_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def lesson_received(data)
    message = current_user.lesson_messages.create!(body: data['message'], parent_id: data["parent_id"], lesson_id: data['lesson_id'])
    ActionCable.server.broadcast "lesson_rooms_#{message.lesson.id}_channel", data: render_message(message), msg: message
  end

  private

  def render_message(message)
    ApplicationController.renderer.render partial: 'lesson_messages/lesson_message', locals: {lesson_message: message}
  end
end
