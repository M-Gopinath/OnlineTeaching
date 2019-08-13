class Students::LessonsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show,:new]
  layout "sub_domain"
 
  def index
    @courses = Course.all
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson.course.users.where(user_id: current_user)
    @course = Course.find(params[:course])
    @activities = @lesson.all_activities.paginate(page: params[:page], per_page: 4)
  end

  def show_activity
    @type = params[:type]
    @activity = Object.const_get(params[:type]).find(params[:activity_id])
    @course = @activity.try(:lesson).try(:course)
    @answer = StudentAnswer.new
  end

  def create_student_answers
    @answers = current_user.student_answers.build(student_answer_params)
    @type = params[:type]
    @activity = Object.const_get(params[:type]).find(params[:type_id])
    @course = @activity.try(:lesson).try(:course)
    @answers.activity_answer_type = params[:type]
    @answers.activity_answer_id = params[:type_id]
    @answers.course_id = @course.id
    @answers.save
    @answer = StudentAnswer.new
    @all_answers = @course.student_answers.where(user_id: current_user.id).count
    @all_questions = @course.activity_questions.count
    @percent = ((@all_answers.to_f / @all_questions.to_f) * 100).round(2)
    respond_to do |format|
      format.js
      format.html {redirect_back(fallback_location: root_path)}
    end
  end

  private
  
  def student_answer_params
    params.require(:student_answer).permit(:name, :activity_question_id)
  end

end
