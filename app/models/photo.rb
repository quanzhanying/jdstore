class Photo < ApplicationRecord
  mount_uploader :avater,AvatarUploader
  belongs_to :product 
end
