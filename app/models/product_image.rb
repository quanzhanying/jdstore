class ProductImage < ApplicationRecord
  mount_uploader :big_image, ImageUploader
  belongs_to :product
end
