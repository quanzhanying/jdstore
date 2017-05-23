class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :content, presence: true
end
