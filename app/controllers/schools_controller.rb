class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :student_not_allowed, only: [:setup]
  layout 'sub_domain'
  def index
    @admins = User.admin
    @teachers = User.teacher
    @students = User.student
    @posts = Post.where(parent_id: nil)
    @post = Post.new
    @post.post_images.build
    @announcement = Announcement.new
    @announcements = Announcement.non_archive
  end

  def setup
    @organization = OrganizationInformation.get_setup_school
    @teachers = (User.admin + User.teacher + User.super_admin).uniq
    @course = Course.get_setup_course
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
    @lessons = Lesson.all
    @all_templates = ClientTemplate.active
    @paid_templates = ClientTemplate.paid
    @free_templates = ClientTemplate.free
    @plans = Plan.active
  end

  def notifications
    @notifications = current_user.unread_announcements
    update_unread_announcements
  end

  def update_unread_announcements
    @notifications.each do |ua|
      if ua.class.name == "Announcement"
        ua.notification_activities.build(user_id: current_user.id)
        ua.save
      elsif ua.class.name == "Mailboxer::Conversation"
        ua.mark_as_read(current_user)
      end
    end
  end

  def global_chats
    @posts = Post.where(parent_id: nil).order(id: :desc)
    @post = Post.new
    @post.post_images.build
    current_user.unread_posts.update_all(read_at: Time.now)
  end

  private
  def student_not_allowed
      if current_user.student? || (!current_user.student? and SchoolSetupTooltip.last.try(:launch))
        redirect_to root_path
      end
  end
end
