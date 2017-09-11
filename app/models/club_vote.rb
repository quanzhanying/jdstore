class ClubVote < ApplicationRecord
  belongs_to :club
  belongs_to :user
end
