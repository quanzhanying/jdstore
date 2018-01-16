class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  has_many :favorites
  has_many :favorited_users, :through => :favorites, :source => :user
  has_many :comments
  belongs_to :category
end
