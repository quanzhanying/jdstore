# == Schema Information
#
# Table name: product_lists
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  price      :float
#  order_id   :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
