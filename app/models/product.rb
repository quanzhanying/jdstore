class Product < ApplicationRecord
  has_many :comments

  mount_uploader :image, ImageUploader

  acts_as_votable
end
