class Review < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  belongs_to :product, counter_cache: true
end
