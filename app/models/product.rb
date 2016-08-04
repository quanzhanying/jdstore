class Product < ApplicationRecord
  mount_uploader :image, ImageUploaderUploader
  validates :title,presence: true
end
