class Users::RegistrationsController < Devise::RegistrationsController
  layout "sub_domain"
  respond_to :html, :js

  def create
    build_resource(sign_up_params)
    current_domain = Apartment::Tenant.current
    resource.subdomain = current_domain
    resource.save
    @resource = resource

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end
    @user = User.find(current_user.id)
    p "account_update_params"
    p account_update_params
    if @user.first_name == account_update_params[:first_name] and @user.last_name == account_update_params[:last_name]
      account_update_params.delete("current_password")
      p @user.update_without_password(account_update_params)
      p @user.errors
      @update = true
    else
      @update = update_resource(@user, account_update_params)
    end
    if @update
      bypass_sign_in @user#, :bypass => true
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end