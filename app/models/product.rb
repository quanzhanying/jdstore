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
#  position    :integer
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :photos
  accepts_nested_attributes_for :photos

  acts_as_list
  scope :recent, -> { order("created_at DESC")}

  belongs_to :category

  has_many :product_user_relationships
  has_many :members, :through => :product_user_relationships, :source => :user
  acts_as_votable    # 点赞
  has_many :reviews

end
