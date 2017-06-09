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
#  particulars :text
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  validates :category_id, presence: true


  has_many :favorites
  has_many :users, through: :favorites, source: :user
  has_many :reviews, dependent: :destroy
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images # 可以直接通过Product class上传ProductImage class中的图片，具体解释参见：http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html
  has_many :product_particular_images, dependent: :destroy
  accepts_nested_attributes_for :product_particular_images
end
