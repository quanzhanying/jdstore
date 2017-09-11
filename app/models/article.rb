class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  belongs_to :user
  has_many :article_reviews, dependent: :destroy


  # ---收藏商品功能三方关系代码块---

  has_many :article_collections                   # 收藏文章关系
  has_many :members, through: :article_collections, source: :user


  # ---后台隐藏或公开按钮---

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
