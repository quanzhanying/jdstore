# == Schema Information
#
# Table name: product_particular_images
#
#  id         :integer          not null, primary key
#  product_id :integer
#  image      :string
#  main_image :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductParticularImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
