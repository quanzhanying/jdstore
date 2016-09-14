# == Schema Information
#
# Table name: product_relationships
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductRelationship < ApplicationRecord
  belongs_to :product
  belongs_to :user
end
