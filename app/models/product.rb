class Product < ApplicationRecord
  validates :title,:price,:quantity, presence: true

  mount_uploader :image, ImageUploader
end
