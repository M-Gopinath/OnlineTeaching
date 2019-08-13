class MessagesController < ApplicationController
  layout "sub_domain"
  before_action :authenticate_user!

  def users_list
    @users = User.where.not(id: current_user.id)
  end
end
