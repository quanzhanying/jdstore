# == Schema Information
#
# Table name: item_lists
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  item_name  :string
#  item_price :float
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemList < ApplicationRecord
  belongs_to :order
end
