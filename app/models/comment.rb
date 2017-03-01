class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, presence: true
end
