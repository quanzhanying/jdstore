class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
    validates :title, presence: true
    validates :description, presence: true
    validates :quantity, presence: true
    validates :price, presence: true
    validates :price, numericality: { greater_than: 0}
  belongs_to :category
end
