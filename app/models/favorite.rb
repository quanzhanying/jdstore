class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :post
end
