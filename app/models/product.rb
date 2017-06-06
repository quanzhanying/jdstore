class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list


  belongs_to :category
  has_many :likes
  has_many :liked_users, through: :likes, source: :user


  has_many :favorites
  has_many :users, through: :favorites, source: :user

  has_many :reviews



end
