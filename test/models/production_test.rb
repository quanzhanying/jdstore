# == Schema Information
#
# Table name: productions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
