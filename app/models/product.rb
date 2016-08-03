# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
    validates :title, presence: true
    validates :price, presence: true
    validates :price, numericality: {greater_than: 0}
end
