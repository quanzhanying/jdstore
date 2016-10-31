class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, presence: true

  validates :price, numericality: { greater_than: 0}
  mount_uploader :image, ImageUploader
end
