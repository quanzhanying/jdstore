class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :goods_attrs, through: :goods_images, source: :goods_images
  has_many :goods_images, through: :goods_images, source: :goods_images


  def is_quwan_goods?
    quwan_goodsid.present?
  end
end
