class Product < ApplicationRecord
  has_many :photos
  accepts_nested_attributes_for :photos
  belongs_to :category

  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user
  has_many :reviews, dependent: :destroy
end
