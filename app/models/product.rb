class Product < ApplicationRecord
  validates :title, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :cart, through: :cart_items, source: :cart
end
