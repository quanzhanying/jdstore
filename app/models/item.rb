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
#

class Item < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :quantity, numericality: { greater_or_equal_to: 0}
	validates :price, numericality: { greater_or_equal_to: 0.0}

	belongs_to :user
end
