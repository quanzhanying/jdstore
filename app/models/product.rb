# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  price       :integer
#  stock       :integer
#  can_sell    :boolean
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  category_id :integer
#  brand_id    :integer
#

class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  # 收藏功能相关开始
  has_many :favorites
  has_many :fans, through: :favorites, source: :user
  # 收藏功能相关结束

  acts_as_votable  #点赞功能

  scope :selling, -> { where(can_sell: true) } # 选出正在销售中的商品
  scope :recent, -> { order('created_at DESC') }  #按照发布时间的顺序

end
