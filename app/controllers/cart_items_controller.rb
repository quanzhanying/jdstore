class CartItemsController < ApplicationController

	def create
		
		#判断库存数量是否够用

		existing_item = CartItem.where(order_id: nil).find_by(product_id: cart_item_params[:product_id])
		stock_number = Product.find(cart_item_params[:product_id]).quantity
		puts "#{stock_number}"

		new_require_number = cart_item_params[:quantity].to_i
	

		if (existing_item && existing_item.quantity >= stock_number) or (existing_item && existing_item.quantity + new_require_number > stock_number) or (new_require_number > stock_number)

			redirect_to :back, notice: "没有更多库存"			
			return
		end

		# 1. 存在同类的商品 2. 属于当前的购物车 3. 价格和已存在商品相同 则新增原有商品数量
		if existing_item && current_cart.id == existing_item.cart_id && existing_item.price == Product.find(cart_item_params[:product_id]).price 
			existing_item.quantity += cart_item_params[:quantity].to_i
			existing_item.save
		else #否则新建购物条目
			@cart_item = CartItem.new(cart_item_params)
			@cart_item.cart_id = current_cart.id

		# 以后可以将这里封装到model中去
			@cart_item.price = Product.find(cart_item_params[:product_id]).price
			@cart_item.save
		end

		redirect_to :back, notice: "成功加入购物车"
	end

	def increment
		cart_id = params[:cart_item_id]
		item = CartItem.find(cart_id)
		if item.quantity + 1 <= item.product.quantity
			item.quantity += 1
			item.save
			redirect_to :back
		else
			redirect_to :back, notice: "没有更多库存"
		end
	end

	def decrement
		cart_id = params[:cart_item_id]
		item = CartItem.find(cart_id)
		if item.quantity - 1 > 0 
			item.quantity -= 1
			item.save
			redirect_to :back
		end
	end



	def destroy
		@cart_item = CartItem.where(order_id: nil).find(params[:id])
		@cart_item.destroy
		redirect_to :back
	end


	private 

	def cart_item_params
		params.require(:cart_item).permit([:quantity, :product_id])
	end

end
