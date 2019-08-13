class Users::SessionsController < Devise::SessionsController
  skip_before_action :check_school_setup
  layout "sub_domain"


  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.valid_password?(params[:user][:password])
      if @user.confirmed_at.present? && @user.is_active
        Apartment::Tenant.switch(@user.subdomain) do 
          sign_in(:user, @user)
        end
      elsif @user.confirmed_at.present? && !@user.is_active
        @error = "Admin has been deactivated your account. please contact Admin"
      elsif @user.is_active && @user.confirmed_at.nil?
        @error = "Please check mail and confirm your account"
      end
    else
      @error = "Invalid Email/Password combination"
      flash[:warning] = @error
    end
  end
end



