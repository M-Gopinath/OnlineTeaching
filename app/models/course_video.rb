class CourseVideo < ApplicationRecord
  belongs_to :course, optional: true
  mount_uploader :video, VideoUploader
  validate :file_size_validation
  private

  def file_size_validation
    errors[:video] << "should be less than 10MB" if video.size > 20.megabytes
  end
end
