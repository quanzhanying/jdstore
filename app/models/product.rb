class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
has_many :favorites
has_many :fans, through: :favorites, source: :user
end
