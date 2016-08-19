class Product < ApplicationRecord
	mount_uploader :image, ImageUploader

	validates :title, presence: true
	#validates :description, presence: true
end
