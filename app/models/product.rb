class Product < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :quantity, presence: true
  # validates :quantity, numericality: {greater_than: 0}
  # validates :price, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}

  mount_uploader :image, ImageUploaderUploader
end
