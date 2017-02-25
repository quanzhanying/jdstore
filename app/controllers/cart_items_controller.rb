class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "成功将 #{@product.title}从购物车中删除！"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])

    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
    @cart_item.update(cart_item_params)
    flash[:notice] = "购买数量已确认"
    else
    flash[:warning] = "数量不足以加入购物车"
    end

    redirect_to carts_path
    end


  def add_quantity
		@cart_item = current_cart.cart_items.find_by_product_id(params[:id])
		if @cart_item.quantity < @cart_item.product.quantity
			@cart_item.quantity = 1
			@cart_item.save
			redirect_to carts_path
		elsif @cart_item.quantity == @cart_item.product.quantity
			redirect_to carts_path, alert: "库存不足！"
		end
	end

	def remove_quantity
		@cart_item = current_cart.cart_items.find_by_product_id(params[:id])
		if @cart_item.quantity > 0
			@cart_item.quantity -= 1
			@cart_item.save
			redirect_to carts_path
		elsif @cart_item.quantity == 0
			redirect_to carts_path, alert: "商品不能少于零！"
		end
	end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
