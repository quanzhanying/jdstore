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
#  position    :integer
#

class Product < ApplicationRecord
  # validates :category_id, presence: true
  mount_uploader :image, ImageUploader
  acts_as_list

  belongs_to :category

  has_many :groupships
  has_many :groups, through: :groupships

  has_many :photos
  accepts_nested_attributes_for :photos

  has_many :comments
end
