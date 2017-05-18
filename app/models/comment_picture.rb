class CommentPicture < ApplicationRecord
  mount_uploader :picture, AvatarUploader
  belongs_to :comment
end
