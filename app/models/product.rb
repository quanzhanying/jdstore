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
#  image       :string
#

class Product < ApplicationRecord
  validates :title, presence: true

  mount_uploader :image, ImageUploader
end
