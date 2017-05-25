class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price ,presence: true
  validates :quantity, presence:true
  validates :image, presence:true
  mount_uploader :image, ImageUploader
  acts_as_list
end
