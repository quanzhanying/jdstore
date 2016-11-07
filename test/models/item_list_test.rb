# == Schema Information
#
# Table name: item_lists
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  item_name  :string
#  item_price :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ItemListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
