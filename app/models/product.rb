class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  scope :recent, -> { order("created_at DESC")}
end
