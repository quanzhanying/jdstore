class Product < ApplicationRecord

	#validates :title, :description, :quantity, :price, presence: true
	#validates :quantity, :price, numericality: { greater_than: 0}

	mount_uploader :image, ImageUploader

	#has_many :pictures

end
