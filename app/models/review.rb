class Review < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :product
end
