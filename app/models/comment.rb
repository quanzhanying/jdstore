class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :comment_pictures,dependent: :destroy
  accepts_nested_attributes_for :comment_pictures

end
