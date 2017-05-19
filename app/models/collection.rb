class Collection < ApplicationRecord

  # 收藏商品关系
  belongs_to :user
  belongs_to :product
end
