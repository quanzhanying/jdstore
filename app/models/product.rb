class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites, source: :user
  has_many  :comments
end
