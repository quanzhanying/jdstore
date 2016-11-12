# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  quantity    :integer
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  in_the_cart :boolean          default(TRUE)
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :cart
end
