# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :integer          default(0)
#  user_id          :integer
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  is_paid          :boolean          default(FALSE)
#  payment_method   :string
#
# Indexes
#
#  index_orders_on_token  (token)
#

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
