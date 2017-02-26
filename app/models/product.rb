class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :photos  
  scope :recent, -> { order("created_at DESC") }
end
