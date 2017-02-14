class Product < ApplicationRecord
  #mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :photos
  accepts_nested_attributes_for :photos

  scope :recent, -> { order("created_at DESC") }
  has_many :reviews, dependent: :destroy
end
