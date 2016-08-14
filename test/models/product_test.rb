# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  money       :float
#  storage     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_hidden   :boolean          default(TRUE)
#  image       :string
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
