class Schools::EnrollCourseRoomsController < ApplicationController
  before_action :authenticate_user!

  layout "sub_domain"
  before_action :check_enroll_user, only: [:show]
  skip_before_action :check_school_setup, only: [:create]

  def index
  end

  def create
    if EnrollCourseRoom.find_by(course_id: params[:course_id]).present?
      p @conversation = EnrollCourseRoom.find_by(course_id: params[:course_id])
    else
      @conversation = EnrollCourseRoom.create!(course_room_params)
    end
    @messages = @conversation.enroll_course_messages.order('created_at DESC')
    @message = EnrollCourseMessage.new
    @message.course_chat_attachments.build

    # redirect_to schools_enroll_course_room_path(@conversation)
  end

  def show
    @messages = @conversation.enroll_course_messages.order('created_at DESC')
    @message = EnrollCourseMessage.new
    @message.course_chat_attachments.build
  end

  private

  def course_room_params
    params.permit(:course_id, :title)
  end

  def check_enroll_user
    @conversation = EnrollCourseRoom.find(params[:id])
    @enroll_user = @conversation.course.users.include?(current_user)
    redirect_to root_path unless @enroll_user || current_user.admin_super_admin?
  end
end
