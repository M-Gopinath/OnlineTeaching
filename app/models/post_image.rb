class PostImage < ApplicationRecord
  belongs_to :post, optional: true
  mount_uploader :image, AvatarUploader
  mount_uploader :video, VideoUploader
  mount_uploader :audio, FileUploader
end
