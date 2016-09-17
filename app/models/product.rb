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
  mount_uploader :image, ImageUploaderUploader
  validates :title,presence: true
  validates :price,numericality: { greater_than: 0 }
  validates :quantity,numericality: { greater_than: 0 }
end
