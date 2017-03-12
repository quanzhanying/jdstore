class Product < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price_re, presence: true
  validates :description_re, presence: true
  validates :quantity_re, presence: true

  mount_uploader :image, ImageUploader
  scope :recent, -> { order("created_at DESC")}
end
