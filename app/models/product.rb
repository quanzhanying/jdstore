class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :description, :quantity, :price, presence: true
  validates :quantity, :price, numericality: { greater_than_or_equal_to: 0}

  scope :recent, -> { order("created_at DESC")}
end
