class CourseImage < ApplicationRecord
  belongs_to :course, optional: true
  mount_uploader :image, AvatarUploader
  validate :file_size_validation
  private

  def file_size_validation
    errors[:image] << "should be less than 10MB" if image.size > 10.megabytes
  end
end
