# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :string
#  integer     :string
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Product < ApplicationRecord

	has_many :cart_items

	mount_uploader :image, ImageUploader

	def self.search(value)
		where("title LIKE ? or description LIKE ?", "%#{value}%", "%#{value}%")
	end

end
