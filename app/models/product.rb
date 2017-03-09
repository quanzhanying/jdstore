class Product < ApplicationRecord
  validates :title, presence: true

  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
