class Users::PasswordsController < Devise::PasswordsController
  layout "sub_domain"
  respond_to :html, :js
end
