# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Brand < ApplicationRecord
  has_many :products
  has_many :categories
end
