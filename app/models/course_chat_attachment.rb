class CourseChatAttachment < ApplicationRecord
  belongs_to :enroll_course_message, optional: true
  mount_uploader :image, AvatarUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, FileUploader
end
