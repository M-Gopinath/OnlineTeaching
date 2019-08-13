class EventsController < ApplicationController
  layout "sub_domain"
  before_action :authenticate_user!

  before_action :set_event, only: [:show, :edit, :update, :destroy, :event_show]

  def index
    events = Event.where(from_date: params[:start]..params[:end]).or(Event.where(to_date: params[:start]..params[:end]))
    @events = if current_user.teacher?
      events.where(to_whom: "Teachers").or(events.where(to_whom: "All")).or(events.where(created_by: current_user.id))
    elsif current_user.student?
      events.where(to_whom: "Students", course_id: current_user.courses.uniq.collect(&:id)).or(events.where(to_whom: "All")).or(events.where(created_by: current_user.id))
    else
      events
    end
    @courses = current_user.courses.where(start_date: params[:start]..params[:end]).or(current_user.courses.where(end_date: params[:start]..params[:end]))
    @lessons = Lesson.where(start_date: params[:start]..params[:end]).or(Lesson.where(end_date: params[:start]..params[:end]))
    @video_activities = VideoActivity.where(due_date: params[:start]..params[:end])
    @writing_activies = WritingActivity.where(due_date: params[:start]..params[:end])
    @audio_activities = AudioActivity.where(due_date: params[:start]..params[:end])
    @quiz_activities = QuizActivity.where(due_date: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      users = @event.event_users.collect(&:id).compact
      Resque.enqueue_at(30.seconds.from_now, EventJob, current_user, users, @event.description, "New Event", Apartment::Tenant.current)
    end

  end

  def update
    @event.update(event_params)
    redirect_to calendars_path
  end

  def destroy
    @event.destroy
  end

  def course
    @course = Course.find(params[:id])
  end

  def lesson
    @lesson = Lesson.find(params[:id])
  end

  def video_activity
    @video_activity = VideoActivity.find(params[:id])
  end

  def audio_activity
    @audio_activity = AudioActivity.find(params[:id])
  end

  def writing_activity
    @writing_activity = WritingActivity.find(params[:id])
  end

  def quiz_activity
    @quiz_activity = QuizActivity.find(params[:id])
  end

  def reading_activity
    @reading_activity = ReadingActivity.find(params[:id])
  end

  def essay_activity
    @essay_activity = EssayActivity.find(params[:id])
  end

  def page_activity
    @page_activity = PageActivity.find(params[:id])
  end

  def document_activity
    @document_activity = DocumentActivity.find(params[:id])
  end

  def presentation_activity
    @presentation_activity = PresentationActivity.find(params[:id])
  end

  def discussion_activity
    @discussion_activity = DiscussionActivity.find(params[:id])
  end


  def event_show
    user_notify = @event.event_notification.user_notifications.find_by(id: params[:notify_id])
    user_notify.update(read_at: Time.now) if user_notify.unread?
  end

  def self_event
    @event = Event.new
  end

  def event
    @event = Event.find(params[:id])
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :from_date, :to_date, :color, :is_public, :course_id, :to_whom, :description, :created_by, :user_id)
    end
end
