class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  acts_as_votable

  belongs_to :user
  has_many :comments
end
