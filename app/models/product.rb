class Product < ApplicationRecord
  mount_uploader :pic, AvatarUploader

  validates :title, presence: true
  validates :pic, presence: true
end
