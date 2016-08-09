class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :money, presence: true
  validates :storage, presence:true

  mount_uploader :image, ImageUploader
end
