class OrganizationInformation < ApplicationRecord
  mount_uploader :landing_page_image, AvatarUploader
  mount_uploader :logo, AvatarUploader
  validate :file_size_validation

  def self.get_setup_school
    self.first.present? ? self.first : self.new
  end

  def self.progress_bar_setup
    organization = OrganizationInformation.first
    organization.present? && organization.name.present? && organization.description.present? && organization.landing_page_image.present? && organization.logo.present?
  end

  private

  def file_size_validation
    errors[:landing_page_image] << "should be less than 5MB" if landing_page_image.size > 10.megabytes
    errors[:logo] << "should be less than 20MB" if logo.size > 10.megabytes
  end

  def self.school_logo
    last.try(:logo).present? ? last.try(:logo).url : "/assets/logo-1.png"
  end

  def self.school_name
    last.try(:name).present? ? last.try(:name) : "SchoolName"
  end

end
