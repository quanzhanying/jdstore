class Product < ApplicationRecord

	validates :title, :description, :quantity, :price, presence: true
	validates :quantity, :price, numericality: { greater_than_or_equal_to: 0}

	mount_uploader :image, ImageUploader

end
