class Schools::MarketingsController < ApplicationController
  layout 'sub_domain'
  # theme 'basic'
  before_action :first_organization
  def index
    @all_templates = ClientTemplate.active
  end

  def update_marketing
    @organization.update_attributes(name: params[:school_name],description: params[:school_desc])
    @organization.update_attributes(logo: params[:logo]) if params[:logo].present?
    @organization.update_attributes(landing_page_image: params[:cover_image]) if params[:cover_image].present?
    @client.update(client_template_id: params[:template_id])
  end

  private

  def first_organization
    @organization = OrganizationInformation.first
    @client = current_account
  end
end
