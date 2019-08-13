class ClientsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(subdomain: params[:client][:subdomain])
    user_attributes = params[:client][:owner]
    @client.email = user_attributes[:email]
    @client.orgination_name = user_attributes[:orgination_name]
    respond_to do |format|
      if @client.valid?
        @client.save
        Apartment::Tenant.create(@client.subdomain)
        Apartment::Tenant.switch(@client.subdomain) do 
          user = User.new
          user.subdomain = @client.subdomain
          user.subdomain = @client.subdomain  
          user.password = user_attributes[:password]
          user.password_confirmation = user_attributes[:password_confirmation]
          user.orgination_name = user_attributes[:orgination_name]
          user.email = user_attributes[:email]
          user.first_name = user_attributes[:first_name]
          user.last_name = user_attributes[:last_name]
          CommonTask.load_default_data
          user.role = Role.super_admin
          user.save
        end
        format.html {redirect_to new_user_session_url(subdomain: @client.subdomain)}
        format.js
      else
        # render action: 'new'
        format.html { render :new }
        format.js
      end
    end
  end

  private
  def account_params
    params.require(:client).permit(:subdomain, owner_attributes: [:email, :password, :password_confirmation, :orgination_name, :user_type_id, :first_name, :last_name, :user_name])
  end
end
