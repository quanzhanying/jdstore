# == Schema Information
#
# Table name: product_relations
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
