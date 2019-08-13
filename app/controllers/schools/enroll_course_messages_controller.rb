class Schools::EnrollCourseMessagesController < ApplicationController
  before_action :authenticate_user!
  layout "sub_domain"
  def create
    @conversation = EnrollCourseRoom.find(params[:enroll_course_room_id])
    @message = @conversation.enroll_course_messages.build(message_params)
    @message.course_id = @conversation.course_id
    @message.user_id = current_user.id
    @message.save
    @path = schools_enroll_course_room_path(@conversation)
  end

  def like
    @enroll_course_message = EnrollCourseMessage.find_by(id: params[:id])
    like = @enroll_course_message.user_like(current_user)
    if like.present?
      current_user.course_chat_likes.where(enroll_course_message_id: @enroll_course_message.id).destroy_all
    else
      current_user.course_chat_likes.create(enroll_course_message_id: @enroll_course_message.id)
    end
  end

  private

  def message_params
    params.require(:enroll_course_message).permit(:body, course_chat_attachments_attributes: [:image, :video, :audio])
  end
end
