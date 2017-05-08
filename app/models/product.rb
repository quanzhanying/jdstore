class Product < ApplicationRecord
  validates :title,:price,:quantity, presence: true
end
