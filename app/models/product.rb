class Product < ApplicationRecord
  validates :title,presence:true
  # belongs_to :users
  mount_uploader :image, ImageUploader 
end
