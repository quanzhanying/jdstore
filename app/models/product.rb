class Product < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader
  scope :recent, -> { order("created_at DESC")}
end
