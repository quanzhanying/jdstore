class Product < ApplicationRecord
	validates :title, :description, :price, :storage, presence: true

	def publish!
		self.is_hidden = false
		save
	end

	def hide!
		self.is_hidden = true
		save
	end

	mount_uploader :image, ImageUploader
end
