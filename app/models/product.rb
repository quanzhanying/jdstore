class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :quantity, presence: true
end
