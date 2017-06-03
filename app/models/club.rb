class Club < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :club_reviews, dependent: :destroy


  # ---社群帖子点赞功能三方关系代码块---

  has_many :club_votes
  has_many :members, through: :club_votes, source: :user


  # ---社群帖子收藏功能三方关系代码块---

  has_many :club_collections                   # 收藏社群帖子关系
  has_many :members, through: :club_collections, source: :user

end
