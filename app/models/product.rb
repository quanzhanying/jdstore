class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :quantity, presence: {message: "请填写商品上架数量"}
  validates :price, presence: {message: "请填写商品上架价格"}
  validates :quantity, numericality: {greater_than: -1 , message: "商品上架数量不能小于0"}
  validates :price, numericality: {greater_than: 0, message: "商品上架价格不能低于0"}

  has_many :comments
end
