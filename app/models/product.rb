class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :product_lists
end
