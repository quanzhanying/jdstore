class Product < ApplicationRecord
	mount_uploader :image, ImageUploader

	validates :title, presence: true
	#validates :description, presence: true
    #validates :wage_lower_bound, presence: true
end
