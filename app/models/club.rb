class Club < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :club_reviews, dependent: :destroy
end
