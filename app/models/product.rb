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
#  category_id :integer
#

class Product < ApplicationRecord
  validates :category_id, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :category

  has_many :groupships
  has_many :groups, through: :groupships
end
