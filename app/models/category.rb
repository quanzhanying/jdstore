class Category < ApplicationRecord
  has_many :products
  has_many :posts
end
