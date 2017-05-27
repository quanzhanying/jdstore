# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  product_id :integer
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_product_id  (product_id)
#  index_comments_on_user_id     (user_id)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :body, presence: true
end
