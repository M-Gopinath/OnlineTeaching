class EventAttendeeGroupsController < ApplicationController
  layout "sub_domain"
  before_action :authenticate_user!
  def index
    @groups = EventAttendeeGroup.active
  end
  def new
    @group = EventAttendeeGroup.new 
    @courses = Course.all.collect(&:name)
    @teachers = User.teacher
    @students = User.student
  end

  def create
    @group = EventAttendeeGroup.new(group_params)
    @group.user_id = params[:user_id].join(",") if params[:user_id].present?
    if @group.save
      redirect_to event_attendee_groups_path
    else
      render 'new'
    end
  end

  def destroy
    @group = EventAttendeeGroup.find(params[:id])
    if @group.destroy
      redirect_to event_attendee_groups_path
    else
      render 'index'
    end
  end

  def course_enrolled_users
    course = Course.find_by(name: params[:course])
    @teachers = course.enrolled_teachers
    @students = course.enrolled_students
  end

  private

  def group_params
    params.require(:event_attendee_group).permit(:name, :description, :is_active)
  end
end
