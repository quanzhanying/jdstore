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
#  category_id :integer
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  validates :category_id, presence: true
end
