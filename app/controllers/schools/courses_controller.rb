class Schools::CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show,:new]
  skip_before_action :check_school_setup
  layout "sub_domain", only: [:index,:show,:new, :all_gradebooks]
  def create
    course = Course.find_by(id: params[:course][:id])
    @course = course.present? ? course : Course.new #Course.get_setup_course
    authorize @course

    @teachers = User.teacher
    if @course.new_record?
      @course = Course.new(course_params)
      if @course.save
        # UserMailer.create_course(@course).deliver
        system("rake course_create_and_update:course_mail COURSEID=#{@course.id} DOMAIN=#{Apartment::Tenant.current} &")
        flash[:success] = "Successfully Created"
      end
    else
      if @course.update(course_params)
        flash[:success] = "Successfully Updated"
      end
    end
    unless current_user.teacher?
      teachers = params[:user_ids]
      enrolled_teachers = @course.course_users.joins(:user => :role).where("roles.name = ?", "Teacher")
      enrolled = enrolled_teachers.where.not(user_id: teachers)
      enrolled.destroy_all 
      if teachers.present?
        teachers.each do |teacher|
          user = User.find teacher
          enroll = user.course_users.find_or_initialize_by(course_id: @course.id)
          enroll.save
        end
      end
    end
    EnrollCourseRoom.create(course_id: @course.id) unless @course.enroll_course_room.present?
    @course.course_users.build if @course.course_users.empty?
    @course.course_attachments.build if @course.course_attachments.empty?
    @course.course_images.build if @course.course_images.empty?
    @course.course_videos.build if @course.course_videos.empty?
  end


  def update_course_videos
    info = CourseVideo.find(params[:id])
    if info.present?
      info.remove_video = true
      info.save
    end
    render json: {message: "success"}
  end

  def update_course_image
    info = CourseImage.find(params[:id])
    if info.present?
      info.remove_image = true
      info.save
    end
    render json: {message: "success"}
  end

  def update_course_attachment
    info = CourseAttachment.find(params[:id])
    if info.present?
      info.remove_attachment = true
      info.save
    end
    render json: {message: "success"}
  end


  def course_edit
    @course = params[:course].present? ? Course.find_by(id: params[:course]) : Course.first
    @teachers = User.teacher
  end

  def update_course_files
    course = Course.find(params[:id])
    if params[:type] == "attachment"
      course.course_attachments.each do |a|
        a.remove_attachment = true
        a.save
      end
    elsif params[:type] == "image"
      course.course_images.each do |i|
        i.remove_image = true
        i.save
      end
    elsif params[:type] == "video"
      course.course_videos.each do |v|
        v.remove_video = true
        v.save
      end
    end
    # UserMailer.update_course(course).deliver
    render json: {message: "Success"}
  end

  def index
    if params[:search].present?
      @courses = Course.where("name ILIKE (?)","%#{params[:search]}%").paginate(page: params[:course], per_page: 10)
    else
      @courses = Course.all.paginate(page: params[:course], per_page: 10)
    end
  end

  def show
    course = Course.find_by(id: params[:id])
    @teachers = User.teacher
    @course = course.present? ? course : Course.new
    @course.course_users.build if @course.new_record? || @course.course_users.empty?
    @course.course_attachments.build if @course.new_record? || @course.course_attachments.empty?
    @course.course_images.build if @course.new_record? || @course.course_images.empty?
    @course.course_videos.build if @course.new_record? || @course.course_videos.empty?
    @lesson = Lesson.new
    @lesson.lesson_users.build
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
    @lessons = @course.lessons
    @announcement = Announcement.new
    @announcements = Announcement.non_archive
    @organization = OrganizationInformation.last
    current_user.unread_course_chats.update_all(read_at: Time.now)
    if course.present? && !policy(course).own_course?
      redirect_to schools_courses_path
    end
  end

  def new
    @teachers = User.teacher
    @course = Course.new
    @course.course_users.build if @course.new_record? || @course.course_users.empty?
    @course.course_attachments.build if @course.new_record? || @course.course_attachments.empty?
    @course.course_images.build if @course.new_record? || @course.course_images.empty?
    @course.course_videos.build if @course.new_record? || @course.course_videos.empty?
    @lesson = Lesson.new
    @lesson.lesson_users.build
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
    @lessons = @course.lessons
    @announcement = Announcement.new
    @announcements = Announcement.non_archive
  end

  def enroll_course
    @course = Course.find(params[:id])
    enroll = current_user.course_users.build(course_id: @course.id)
    enroll.save
  end

  def clone_course
    @course = Course.find(params[:id])
    @new_course = @course.dup
    @new_course.clone_count = 0
    @new_course.save
    @course.lessons.each do |lesson|
      new_les = lesson.dup
      new_les.course_id = @new_course.id
      new_les.save
      lesson.clone_activities
    end
    @course.course_images.each do |image|
      new_image = image.dup
      new_image.course_id = @new_course.id
      new_image.save
    end
    @course.course_videos.each do |video|
      new_video = video.dup
      new_video.course_id = @new_course.id
      new_video.save
    end

    @course.course_attachments.each do |attachment|
      new_attachment = attachment.dup
      new_attachment.course_id = @new_course.id
      new_attachment.save
    end

    @course.course_users.each do |cu|
      new_cu = cu.dup
      new_cu.course_id = @new_course.id
      new_cu.save
    end
    @course.update(clone_count: @course.clone_count+1)

    redirect_to schools_course_path(@new_course)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to schools_courses_path
  end

  def documents
    @course = Course.find(params[:course_id])
  end

  def download_file
    send_file params[:file], :disposition => 'attachment'
  end

  def gradebooks
    @course = Course.find(params[:course_id])
  end

  def enroll_students
    @course = Course.find(params[:course_id])
    students = params[:student_ids]
    if students.present?
      if params[:type] == "cancel"
        enrolled_students = @course.course_users.joins(:user => :role).where("roles.name = ?", "Student")
        enrolled = enrolled_students.where(user_id: students)
        enrolled.destroy_all
      elsif params[:type] == "enroll"
        students.each do |student|
          user = User.find student
          enroll = user.course_users.find_or_initialize_by(course_id: @course.id)
          enroll.save
        end
      end
    end
  end

  def correction
    @type = params[:type]
    @activity = @type.singularize.classify.constantize.find(params[:activity_id])
    @user = User.find(params[:user_id])
  end

  def all_gradebooks
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
              @grade_activities << answer.activity_question.activity if StudentGrade.where(activity_id: activity.id, activity_type: activity.class.name, user_id: answer.user.id, student_answer_id: answer.id).present?
            end
          end
        end
      end
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :subtitle, :start_date, :end_date, :objectives, course_users_attributes: [:id, :user_id, :_destroy], course_attachments_attributes: [:id, :attachment, :_destroy], course_images_attributes: [:id, :image, :_destroy], course_videos_attributes: [:id, :video, :_destroy])
  end

end
