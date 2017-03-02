class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :photos
  accepts_nested_attributes_for :photos
  ratyrate_rateable "speed", "engine", "price"
  has_many :reviews
  belongs_to :product
end
