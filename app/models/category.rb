class Category < ApplicationRecord
  has_many :products, dependent: :destroy
end
