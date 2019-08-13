class PostChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "post_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_count(data)
    post = Post.find_by(id: data['post_id'])
    users = User.all
    n = post.build_post_notification
    n.note = post.description
    n.recipients << users
    n.save!
    data = []
    read_user = post.post_notification.user_notifications.find_by(user_id: post.user_id)
    read_user.update_attributes(read_at: Time.now) if read_user.present?
    User.all.each do |u|
      data << [u.id, number_to_human(u.unread_direct_charts.count, :format => '%n%u', :units => { :thousand => 'K' }),u.unread_charts_notification_template]
    end
    ActionCable.server.broadcast "post_channel", message: data
  end
end
