class Review < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  belongs_to :product, counter_cache: true
  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user
end
