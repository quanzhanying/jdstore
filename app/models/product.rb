class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  has_many :reviews, dependent: :destroy           #商品留言关系，dependent: :destroy表述联级删除
end
