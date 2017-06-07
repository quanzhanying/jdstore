class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list
  belongs_to :category
  has_many :comments
  has_many :photos
  accepts_nested_attributes_for :photos
  has_many :favorites
  has_many :favorited_users, :through => :favorites, :source => :user

  scope :random2, -> { limit(2).order("RANDOM()") }

end
