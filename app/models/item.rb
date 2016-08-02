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
#

class Item < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :quantity, numericality: { greater_than: 0}
	validates :price, numericality: { greater_than: 0.0}

	belongs_to :seller
end
