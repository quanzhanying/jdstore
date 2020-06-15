class Category < ApplicationRecord
  has_many :products
  has_many :posts
  validates :name, presence: true
end
