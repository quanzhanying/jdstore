class Photo < ApplicationRecord
  mount_uploader :avatar,ImageUploader
  belongs_to :product
end
