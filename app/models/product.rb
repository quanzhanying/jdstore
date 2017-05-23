class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :users,through: :favorites,source: :user
end
