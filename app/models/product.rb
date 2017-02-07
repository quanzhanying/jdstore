class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
