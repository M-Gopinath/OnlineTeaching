class CalendarsController < ApplicationController
  layout 'sub_domain'

  def index
  	current_user.unread_events.update_all(read_at: Time.now)
  end
end
