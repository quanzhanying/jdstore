class ClubCollection < ApplicationRecord

  # 收藏帖子关系
  belongs_to :user
  belongs_to :club
end
