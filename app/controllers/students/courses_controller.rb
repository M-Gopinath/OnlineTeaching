class Students::CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show,:new]
  layout "sub_domain", only: [:index,:show,:new]
 
  def index
    @courses = Course.all.paginate(page: params[:course], per_page: 10)
  end

  def show
    # current_user.student_answers.destroy_all
    # CourseRating.all.destroy_all
    @users = User.where.not(id: current_user.id)
    @courses = current_user.courses
    @chat_room = ChatRoom.first
    @message = ChatMessage.new
    @announcements = Announcement.all
    @course = Course.find(params[:id])
    @lessons = Lesson.where(course: @course).paginate(page: params[:page], per_page: 4)
  end

  def lesson_details
    @lesson = Lesson.find_by(id: params[:lesson_id])
  end

  def update_rating
    @course = Course.find(params[:course_id])
    @rating = @course.course_ratings.build(rating: params[:rating], user_id: current_user.id)
    @rating.save
  end

end
