class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader

  belongs_to :category

  has_many :photos
  accepts_nested_attributes_for :photos

end
