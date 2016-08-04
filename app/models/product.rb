# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  validates :title, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}
  validates :price, presence: true

  validates :price, numericality: {greater_than: 0}
end
