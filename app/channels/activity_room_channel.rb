class ActivityRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def activity_received(data)
    message = current_user.activity_messages.create!(body: data['message'], activity_room_id: data['chat_room_id'], parent_id: data["parent_id"], lesson_id: data['lesson_id'])
    ActionCable.server.broadcast "activity_rooms_#{message.activity_room.id}_channel", data: render_message(message), msg: message
  end

  private

  def render_message(message)
    ActivityRoomsController.render partial: 'activity_messages/activity_message', locals: {activity_message: message}
  end
end
