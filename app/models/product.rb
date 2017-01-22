class Product < ApplicationRecord
	validates :title, :description, :price, :storage, presence: true
end
