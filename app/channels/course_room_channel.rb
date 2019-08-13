class CourseRoomChannel < ApplicationCable::Channel
  include ActionView::Helpers::NumberHelper
  def subscribed
    stream_from "enroll_course_chat_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
  end

  def course_received(data)
  	Apartment::Tenant.switch(data['domain']) do
	    converstation = EnrollCourseRoom.find_by(id: data['chat_room_id'])
	    if converstation.present?
		    enroll_course_message = current_user.enroll_course_messages.create!(body: data['message'], enroll_course_room_id: data['chat_room_id'], course_id: converstation.course.id, parent_id: data['parent_id'])
		    course = enroll_course_message.try(:course)
		    if course.present?
		      users = course.users
		      n = enroll_course_message.enroll_course_notification
		      unless n.present?
			      n = enroll_course_message.build_enroll_course_notification
			      n.note = enroll_course_message.body
			      n.recipients << users
			      n.save!
			    end
		      data = []
		      read_user = enroll_course_message.enroll_course_notification.user_notifications.find_by(user_id: enroll_course_message.user_id)
		      read_user.update_attributes(read_at: Time.now) if read_user.present?
		      users.each do |u|
		        data << [u.id, number_to_human(u.unread_direct_charts.count, :format => '%n%u', :units => { :thousand => 'K' }),u.unread_charts_notification_template]
		      end
		      ActionCable.server.broadcast "course_chat_channel", message: data
		  	end
	  	end
	  end
  end
end
