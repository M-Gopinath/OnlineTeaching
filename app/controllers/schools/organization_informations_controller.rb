class Schools::OrganizationInformationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :check_school_setup

  def create
    @organization = OrganizationInformation.get_setup_school
    if @organization.new_record?
      @organization = OrganizationInformation.new(organization_params)
      if @organization.save
        flash[:success] = "Successfully Created"
      end
    else
      if @organization.update(organization_params)
        flash[:success] = "Successfully Updated"
      end
    end
  end

  def update_organization_files
    info = OrganizationInformation.find(params[:id])
    if params[:logo].present?
      info.remove_logo!
    else
      info.remove_landing_page_image!
    end
    info.save
    render json: {message: "success"}
  end

  private

  def organization_params
    params.require(:organization_information).permit(:id, :name, :description, :landing_page_image, :logo)
  end

end
