class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :courseimg, ImageUploader
  acts_as_list

  has_many :reviews, dependent: :destroy           #商品留言关系，dependent: :destroy表述联级删除


  # ---收藏商品功能三方关系代码块---

  has_many :collections                            #收藏商品关系
  has_many :members, through: :collections, source: :user




end
