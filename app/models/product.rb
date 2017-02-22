class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :photos
  accepts_nested_attributes_for :photos
end
