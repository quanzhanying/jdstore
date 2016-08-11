# == Schema Information
#
# Table name: product_lists
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  product_name  :string
#  product_price :integer
#  quantity      :integer
#  product       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id    :integer
#

class ProductList < ApplicationRecord
  belongs_to :order
end
