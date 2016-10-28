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
	mount_uploader :image, ImageUploader

	def self.search(search)
		where("title LIKE ? or description LIKE ?", "%#{search}%", "%#{search}%")
	end

end
