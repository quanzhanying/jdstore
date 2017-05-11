class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :pic, AvatarUploader

  validates :title, presence: true
  validates :pic, presence: true
end
