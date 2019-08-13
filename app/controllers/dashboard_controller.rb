class DashboardController < ApplicationController
  skip_before_action :authenticate_user!#, only: :index
  layout 'sub_domain', only: [:marketing]
  def index
  end

  def signup
  end

  def login
  end

  def forgot_password
  end

end
