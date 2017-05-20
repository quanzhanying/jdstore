# == Schema Information
#
# Table name: groupships
#
#  id         :integer          not null, primary key
#  product_id :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class GroupshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
