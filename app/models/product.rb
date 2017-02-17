class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  scope :recent, -> { order("created_at DESC")}
end
