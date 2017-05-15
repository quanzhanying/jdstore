class Product < ApplicationRecord
  mount_uploader :image,ImageUploader
  has_many :photos
  accepts_nested_attributes_for :photos
  belongs_to :category


  has_many :favorite_lists
  has_many :comments
end
