class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
  mount_uploader :image5, ImageUploader
  belongs_to :user
  belongs_to :category
has_many :favorites
has_many :fans, through: :favorites, source: :user
has_many :photos
has_many :reviews
has_many :favorites
has_many :favorite_products, through: :favorites, source: :user
accepts_nested_attributes_for :photos


end
