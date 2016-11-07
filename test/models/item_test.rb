# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  price        :integer
#  storage      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_available :boolean          default(FALSE)
#  attachment   :string
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
