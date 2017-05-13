class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category

  scope :recent, -> { order("created_at DESC")}
end
