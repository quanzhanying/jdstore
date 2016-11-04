class ProductList < ApplicationRecord
  belongs_to :order

  # def product_list_total_price
  #   sum = 0
  #   product_lists.each do |product_list|
  #     sum += product_list.product_price * product_list.quantity
  #   end
  #   return sum
  # end
end

# == Schema Information
#
# Table name: product_lists
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  product_name  :string
#  product_price :integer
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
