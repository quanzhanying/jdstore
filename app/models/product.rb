class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  belongs_to :user
  has_many :favorites
  has_many :fans, through: :favorites, source: :user

end
