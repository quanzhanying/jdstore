class CommentPicture < ApplicationRecord
  mount_uploader :picture, ImageUploader
  belongs_to :comment
end
