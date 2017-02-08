class Product < ApplicationRecord

  mount_uploader :image, ImageUploader
  
  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

end
