class Schools::LessonsController < ApplicationController
  include SchoolHandler
  skip_before_action :check_school_setup
  before_action :lesson_list
  before_action :new_activities, except: [:create, :update_template, :client_subscription, :launch, :lesson_update, :update, :create_grade]
  def create
    @lesson = Lesson.new(lesson_params)
    @course = @lesson.course
    @new_lesson = Lesson.new
    @new_lesson.lesson_users.build
    if @lesson.save
      flash[:success] = "Successfully Created"
    end
  end

  def create_video
    @video_activity = VideoActivity.new(video_params)
    if @video_activity.save
      @lesson = @video_activity.lesson
      @course = @lesson.course
      update_course(@video_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_quiz
    @quiz_activity = QuizActivity.new(quiz_params)
    if @quiz_activity.save
      @lesson = @quiz_activity.lesson
      @course = @lesson.course
      update_course(@quiz_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_reading
    @reading_activity = ReadingActivity.new(reading_params)
    if @reading_activity.save
      @lesson = @reading_activity.lesson
      @course = @lesson.course
      update_course(@reading_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_essay
    @essay_activity = EssayActivity.new(essay_params)
    if @essay_activity.save
      @lesson = @essay_activity.lesson
      @course = @lesson.course
      update_course(@essay_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_page
    @page_activity = PageActivity.new(page_params)
    if @page_activity.save
      @lesson = @page_activity.lesson
      @course = @lesson.course
      update_course(@page_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_writing
    @writing_activity = WritingActivity.new(writing_params)
    if @writing_activity.save
      @lesson = @writing_activity.lesson
      @course = @lesson.course
      update_course(@writing_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_document
    @document_activity = DocumentActivity.new(document_params)
    if @document_activity.save
      @lesson = @document_activity.lesson
      @course = @lesson.course
      update_course(@document_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_presentation
    @presentation_activity = PresentationActivity.new(presentation_params)
    if @presentation_activity.save
      @lesson = @presentation_activity.lesson
      @course = @lesson.course
      update_course(@presentation_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_audio
    @audio_activity = AudioActivity.new(audio_params)
    if @audio_activity.save
      @lesson = @audio_activity.lesson
      @course = @lesson.course
      update_course(@audio_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def create_discussion
    @discussion_activity = DiscussionActivity.new(discussion_params)
    if @discussion_activity.save
      @lesson = @discussion_activity.lesson
      @course = @lesson.course
      update_course(@discussion_activity)
      flash[:success] = "Successfully Created"
    end
  end

  def update_template
    if params[:temp_id].present?
      current_account.update(client_template_id: params[:temp_id])
    end
  end

  def client_subscription
    plan = Plan.find_by(id: params[:plan_id])
    current_account.subscription(plan)
  end

  def launch
    SchoolSetupTooltip.last.update(launch: true)
    redirect_to root_path
  end

  def lesson_update
    @lesson = params[:id].present? ? Lesson.find(params[:id]) : Lesson.new
    @course = Course.find_by(id: params[:course])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @course = @lesson.course
    @new_lesson = Lesson.new
    @new_lesson.lesson_users.build
    if @lesson.update(lesson_params)
      flash[:success] = "Successfully Created"
    end
  end

  def edit_activity
    @type = params[:activity_name]
    @activity = @type.singularize.classify.constantize.find(params[:activity_id])
  end

  def update_activities
    if params[:video_activity].present?
      @activity = VideoActivity.find(params[:id])
      @activity.update(video_params)
    end
  end



  def position_update
    params[:lesson].each_with_index do |id, index|
      lesson = Lesson.find_by(id: id)
      lesson.update_attributes(position: index+1)
    end
  end

  def update_quiz
    @quiz_activity = QuizActivity.find_by(id: params[:id])
    if @quiz_activity.present?
      @quiz_activity.update(quiz_params)
      @lesson = @quiz_activity.lesson
      @course = @lesson.course
      update_course(@quiz_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_video
    @video_activity = VideoActivity.find_by(id: params[:id])
    if @video_activity.present?
      @video_activity.update(video_params)
      @lesson = @video_activity.lesson
      @course = @lesson.course
      update_course(@video_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_reading
    @reading_activity = ReadingActivity.find_by(id: params[:id])
    if @reading_activity.present?
      @reading_activity.update(reading_params)
      @lesson = @reading_activity.lesson
      @course = @lesson.course
      update_course(@reading_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_essay
    @essay_activity = EssayActivity.find_by(id: params[:id])
    if @essay_activity.present?
      @essay_activity.update(essay_params)
      @lesson = @essay_activity.lesson
      @course = @lesson.course
      update_course(@essay_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_page
    @page_activity = PageActivity.find_by(id: params[:id])
    if @page_activity.present?
      @page_activity.update(page_params)
      @lesson = @page_activity.lesson
      @course = @lesson.course
      update_course(@page_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_writing
    @writing_activity = WritingActivity.find_by(id: params[:id])
    if @writing_activity.present?
      @writing_activity.update(writing_params)
      @lesson = @writing_activity.lesson
      @course = @lesson.course
      update_course(@writing_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_document
    @document_activity = DocumentActivity.find_by(id: params[:id])
    if @document_activity.present?
      @document_activity.update(document_params)
      @lesson = @document_activity.lesson
      @course = @lesson.course
      update_course(@document_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_presentation
    @presentation_activity = PresentationActivity.find_by(id: params[:id])
    if @presentation_activity.present?
      @presentation_activity.update(presentation_params)
      @lesson = @presentation_activity.lesson
      @course = @lesson.course
      update_course(@presentation_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_audio
    @audio_activity = AudioActivity.find_by(id: params[:id])
    if @audio_activity.present?
      @audio_activity.update(audio_params)
      @lesson = @audio_activity.lesson
      @course = @lesson.course
      update_course(@audio_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def update_discussion
    @discussion_activity = DiscussionActivity.find_by(id: params[:id])
    if @discussion_activity.present?
      @discussion_activity.update(discussion_params)
      @lesson = @discussion_activity.lesson
      @course = @lesson.course
      update_course(@discussion_activity)
      flash[:success] = "Successfully Updated"
    end
  end

  def create_grade
    @activity = Object.const_get(grade_params[:activity_type]).find_by(id: grade_params[:activity_id])
    @lesson = @activity.lesson
    @grade = StudentGrade.new(grade_params)
    # @grade = @activity.build_student_grades(grade_params)
    @grade.save
    @non_grade_activities = []
    @grade_activities = []
    courses = if current_user.teacher?
      Course.includes(:lessons).joins(:course_users).where("course_users.user_id = ?", current_user.id)
    elsif current_user.admin_super_admin?
      Course.includes(:lessons)
    end
    courses.each do |course|
      course.lessons.each do |lesson|
        lesson.all_activities.each do |activity|
          activity.activity_questions.each do |question|
            question.student_answers.each do |answer|
              @non_grade_activities << answer.activity_question.activity unless StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: answer.user.id, student_answer_id: answer.id).present?
              @grade_activities << answer.activity_question.activity if StudentGrade.find_by(activity_id: activity.id, activity_type: activity.class.name, user_id: answer.user.id, student_answer_id: answer.id).present?
            end
          end
        end
      end
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:id, :course_id, :name, :description, :start_date, :end_date)
  end

  def video_params
    params.require(:video_activity).permit(:id, :name, :video, :embedded_video, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def quiz_params
    params.require(:quiz_activity).permit(:id, :name, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def reading_params
    params.require(:reading_activity).permit(:id, :name, :documents, :assignment,  :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def essay_params
    params.require(:essay_activity).permit(:id, :name, :description, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def page_params
    params.require(:page_activity).permit(:id, :name, :description, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def writing_params
    params.require(:writing_activity).permit(:id, :name, :question, :description, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]]) 
  end

  def document_params
    params.require(:document_activity).permit(:id, :name, :file_url, :description, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def presentation_params
    params.require(:presentation_activity).permit(:id, :name, :slide_file, :description, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def audio_params
     params.require(:audio_activity).permit(:id, :name, :audio, :embedded_audio, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def discussion_params
     params.require(:discussion_activity).permit(:id, :name, :description, :due_date, :publish, :required, :lesson_id, :activity_points,activity_questions_attributes: [:id,:name, :field_type, :_destroy, activity_answers_attributes: [:id, :name, :is_correct, :_destroy]])
  end

  def grade_params
    params.require(:student_grade).permit(:user_id, :activity_type, :grade, :activity_id, :student_answer_id)
  end

  def lesson_list
    @lessons = Lesson.all
    @teachers = (User.admin + User.teacher + User.super_admin).uniq
  end

  def new_activities
    @video_activity = VideoActivity.new
    @quiz_activity = QuizActivity.new
    @reading_activity = ReadingActivity.new
    @essay_activity = EssayActivity.new
    @page_activity = PageActivity.new
    @writing_activity = WritingActivity.new
    @document_activity = DocumentActivity.new
    @presentation_activity = PresentationActivity.new
    @audio_activity = AudioActivity.new
    @discussion_activity = DiscussionActivity.new
  end

  def update_course(activity)
    activity.activity_questions.update_all(course_id: @course.id)
  end
end
