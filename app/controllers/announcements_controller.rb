class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy, :archive_announcement]
  layout 'sub_domain'

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.non_archive
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:message)
    end
end
