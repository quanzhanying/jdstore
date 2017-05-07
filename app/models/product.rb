class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
