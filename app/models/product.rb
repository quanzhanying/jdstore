class Product < ApplicationRecord
  validates :title, :description, :price, :quantity ,presence: true
  validates :price, :quantity ,numericality: {greater_than:0}

  mount_uploader :image, ImageUploader
end
