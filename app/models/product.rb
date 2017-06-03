class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list


  belongs_to :category
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
<<<<<<< HEAD

  has_many :favorites
  has_many :users, through: :favorites, source: :user
=======
  has_many :reviews


>>>>>>> beeec5d3ffff155512082a95d2004b6d289a4422
end
