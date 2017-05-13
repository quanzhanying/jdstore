class Product < ApplicationRecord
  validates :title, presence: true
  mount_uploader :image, ImageUploader
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
end
