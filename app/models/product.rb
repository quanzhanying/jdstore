class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0}
  validates :quantity, numericality: {greater_than_or_equal_to: 0}
  validates :image, presence: true

  mount_uploader :image, ImageUploader

end
