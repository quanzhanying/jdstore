class Product < ApplicationRecord

  scope :recent, ->{ order('created_at DESC')  }
  mount_uploader :image, ImageUploader
end
