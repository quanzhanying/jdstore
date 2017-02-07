class Product < ApplicationRecord
	validates :title, presence:true
	validates :price, numericality:{:greater_than_or_equal_to => 0}
	validates :quantity, numericality:{:greater_than_or_equal_to => 0}
	mount_uploader :image, ImageUploader
end
