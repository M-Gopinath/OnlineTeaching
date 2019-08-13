class Schools::AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show]
  layout 'sub_domain'

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.non_archive.order(id: :desc).paginate(page: params[:announcement], per_page: 10)
    update_unread_announcements
    @my_announcements = current_user.announcements.order(id: :desc).paginate(page: params[:my_announcement], per_page: 10)
  end

  def update_unread_announcements
    @unread_announcements = current_user.unread_announcements
    @unread_announcements.each do |ua|
      if ua.class.name == "Announcement"
        ua.notification_activities.build(user_id: current_user.id)
        ua.save
      end
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement.notification_activities.find_or_initialize_by(notification_id: @announcement.id, user_id: current_user.id)
    @announcement.save
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
    @announcement = policy_scope(Announcement).find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.course_id = nil if @announcement.course_id == 0
    authorize @announcement

    respond_to do |format|
      if @announcement.save
        @announcement.notification_activities.create(user_id: current_user.id)
        users = @announcement.announcement_users.collect(&:id).compact
        Resque.enqueue_at(30.seconds.from_now, AnnouncementJob, current_user, users, @announcement.message, "New Announcement", Apartment::Tenant.current)
        format.html { redirect_to schools_announcements_path, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
        format.js { render 'new.js.erb' }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    @announcement = policy_scope(Announcement).find(params[:id])
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to schools_announcements_path, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement }
        format.js { render 'update.js.erb' }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement = policy_scope(Announcement).find(params[:id])
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to schools_announcements_path, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render 'destroy.js.erb'}
    end
  end

  def archive_announcement
    @announcement = policy_scope(Announcement).find(params[:id])
    @announcement.update(archive: !@announcement.archive)
    respond_to do |format|
      format.html { redirect_to schools_announcements_path, notice: 'Announcement was successfully archived.' }
      format.json { head :no_content }
      format.js {render 'archive_announcement.js.erb'}
    end
  end

  def sort_announcements
    @announcements = Announcement.non_archive.order(id: :desc).paginate(page: params[:announcement], per_page: params[:list])
    update_unread_announcements
    @my_announcements = current_user.announcements.order(id: :desc).paginate(page: params[:my_announcement], per_page: params[:list])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:message, :course_id, :user_id, :important, :title, :is_public, :to_whom)
    end
end
