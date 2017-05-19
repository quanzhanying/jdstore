# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Product < ApplicationRecord
  has_many :cart_items
  has_many :cart, through: :cart_items, :dependent => :destroy

  mount_uploader :image, ImageUploader
  acts_as_list
end
