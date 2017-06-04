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

  validates :name, presence: { message: "請輸入商品名稱" }
  validates :price, presence: { message: "請輸入商品售價" }
  validates :price, numericality: { greater_than: 0, message: "請輸入商品售價，必須大於零" }
  validates :stock, presence: { message: "請入庫存數量" }, numericality: { greater_than_or_equal: 0 }
  validates :category_id, presence: { message: "請選擇商品分類" }
  validates :brand_id, presence: { message: "請選擇商品品牌" }

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :category
  belongs_to :brand

  # 收藏功能相关开始
  has_many :favorites
  has_many :fans, through: :favorites, source: :user
  # 收藏功能相关结束

  # 多图上传与photos的关系
  has_many :photos
  accepts_nested_attributes_for :photos
  # 多图上传与photos的关系结束

  # 评论相关
  has_many :comments
  # 评论相关结束

  acts_as_votable  #点赞功能

  scope :selling, -> { where(can_sell: true) } # 选出正在销售中的商品
  scope :recent, -> { order('created_at DESC') }  #按照发布时间的顺序
  scope :random8, -> { limit(8).order('RANDOM()') } #随机选出8个样品

end
