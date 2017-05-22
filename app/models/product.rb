class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
has_many :favorites
has_many :fans, through: :favorites, source: :user
has_many :photos
accepts_nested_attributes_for :photos
end
