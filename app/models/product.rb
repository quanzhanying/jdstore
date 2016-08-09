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
  
  has_many :cart_items
  has_many :carts, through: :cart_items, source: :cart
  mount_uploader :image, ImageUploader


end
