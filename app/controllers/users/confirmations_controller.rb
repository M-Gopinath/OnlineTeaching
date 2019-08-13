class Users::ConfirmationsController < Devise::ConfirmationsController
  layout "sub_domain"

  def create
    client = Client.find_by(email: params[:user][:email])
    Apartment::Tenant.switch(client.subdomain) do
      self.resource = resource_class.send_confirmation_instructions(resource_params)
      yield resource if block_given?
      p resource.errors
      if successfully_sent?(resource)
        respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
      else
        respond_with(resource)
      end
    end
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?
    if resource.errors.empty?
      set_flash_message!(:notice, :confirmed)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      flash[:warning] = "You have already confirmed your email address"
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    end
  end
end
