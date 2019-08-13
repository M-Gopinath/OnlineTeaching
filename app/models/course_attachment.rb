class CourseAttachment < ApplicationRecord
  belongs_to :course, optional: true
  mount_uploader :attachment, FileUploader
  validate :file_size_validation
  private

  def file_size_validation
    errors[:attachment] << "should be less than 10MB" if attachment.size > 10.megabytes
  end
end
