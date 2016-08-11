# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  total            :integer          default(0)
#  billing_name     :string
#  billing_address  :string
#  shipping_name    :string
#  shipping_address :string
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  token            :string
#  payment_method   :string
#  is_paid          :boolean          default(FALSE)
#  aasm_state       :string           default("order_placed")
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
