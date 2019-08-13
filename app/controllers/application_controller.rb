class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	# before_action :authenticate_user!
  before_action :load_schema, :authenticate_user!
  before_action :check_school_setup, except: [:setup]
  helper_method :admin?
  helper_method :mailbox, :conversation
  include Pundit
  require 'will_paginate/array'
  
  private

  def load_schema
    Apartment::Tenant.switch!("public")
    return unless request.subdomain.present?
    if current_account
      Apartment::Tenant.switch!(current_account.subdomain)
    else
      redirect_to root_url(subdomain: false)
    end

  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:orgination_name, :user_type_id, :role_id, :first_name, :last_name, :user_name, :facebook_url, :linkedin_url, :twitter_url, :instagram_url, :bio, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:orgination_name, :user_type_id, :role_id, :first_name, :last_name, :user_name, :facebook_url, :linkedin_url, :twitter_url, :instagram_url, :bio, :avatar])
  end


  def current_account
    @current_account ||= Client.find_by(subdomain: request.subdomain)
  end

  helper_method :current_account

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def check_school_setup
    if current_user && current_user.subdomain.present?
      Apartment::Tenant.switch(current_user.subdomain) do
        if admin?
          sst = SchoolSetupTooltip.last
          unless sst.launch
            redirect_to schools_setup_path unless params[:stripeToken].present?
          end
        end
      end
    end
  end

  def admin?
    current_user && current_user.role.name == "Super Admin"
  end

end
