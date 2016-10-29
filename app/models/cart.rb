# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, through: :cart_items, source: :product
	belongs_to :user



	# def self.current_cart
	# 	cart = Cart.find_by(id: session[:cart_id]) 

	# 	if cart.nil?
	# 		cart = Cart.new
	# 		cart.save
	# 		session[:cart_id] = cart.id
	# 	end

	# 	return cart

	# end


end
