# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  quantity    :integer
#  price       :float
#  user_id     :integer
#  image       :string
#

class Item < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :quantity, numericality: { greater_or_equal_to: 0 }
	validates :price, numericality: { greater_or_equal_to: 0.0 }

	belongs_to :user
	has_many :relationship_item_and_users, dependent: :destroy
	has_many :fans, :through => :relationship_item_and_users, source: :user

	mount_uploader :image, ImageUploader

	def quantity_decrease(i)
		self.quantity = self.quantity - i
	end

	def quantity_increase(i)
		self.quantity = self.quantity + i
	end

end
