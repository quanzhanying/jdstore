class Product < ApplicationRecord::Base
  mount_uploader :image, ImageUploader
end
