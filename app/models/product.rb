class Product < ApplicationRecord
	mount_uploader :image, ImageUploader

	#validates :title, presence: true
	#validates :wage_upper_bound, presence: true
    #validates :wage_lower_bound, presence: true
end
