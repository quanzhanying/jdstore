class Product < ApplicationRecord
    validates :title, presence: true
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
end
