class Product < ApplicationRecord

	validates :title, :description, :quantity, :price, presence: true
	validates :quantity, :price, numericality: { greater_than: 0}
	
end
