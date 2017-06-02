class ArticleCollection < ApplicationRecord

  # 收藏文章关系
  belongs_to :user
  belongs_to :article
end
