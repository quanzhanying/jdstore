# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  status              :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  delivery_address_id :integer
#  user_id             :integer
#  aasm_state          :string
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
