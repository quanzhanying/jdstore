# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :float            default(0.0)
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  payment_method   :string
#  aasm_state       :string           default("order_created")
#  order_state      :string           default("等待付款")
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
