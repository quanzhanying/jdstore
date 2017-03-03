class Product < ApplicationRecord

  belongs_to :category
  has_many :photos
  has_many :product_images

  accepts_nested_attributes_for :photos

  mount_uploader :image, ImageUploader
end
