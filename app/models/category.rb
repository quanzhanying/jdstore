# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :products
end
