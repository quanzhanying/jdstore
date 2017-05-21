class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC')}
end
