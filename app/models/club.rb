class Club < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :club_reviews, dependent: :destroy


  # ---社群点赞功能三方关系代码块---

  has_many :club_votes
  has_many :members, through: :club_votes, source: :user
end
