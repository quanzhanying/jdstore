class CartItemsController < ApplicationController
  before_action :find_cart_item, only: [:destroy, :update, :add_quantity, :remove_quantity]
  respond_to :js

   def destroy
     @cart = current_cart
     @cart_item = @cart.cart_items.find_by(product_id: params[:id])
     @product = @cart_item.product
     @cart_item.destroy

    #  flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
    #  redirect_to :back
    @product.quantity += @cart_item.quantity
    @product.save
    respond_to do |format|
      format.js   { render :layout => false }
    end
   end

   def update
     @cart = current_cart
     @cart_item = @cart.cart_items.find_by(product_id: params[:id])
     if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
       @cart_item.update(cart_item_params)
       flash[:notice] = "成功变更数量"
     else
       flash[:warning] = "数量不足以加入购物车"
     end
     redirect_to carts_path
   end

  #  def add_quantity
  #    @cart = current_cart
  #    @cart_item = @cart.cart_items.find_by(product_id:params[:id])
  #      @cart_item.quantity.create
  #      @cart_item.update(cart_item_params)
  #      flash[:notice] = "成功变更数量"
  #    redirect_to carts_path
  #  end

   private
   def find_cart_item
     @cart = current_cart
     @cart_item = @cart.cart_items.find_by(product_id: params[:id])
   end

   def cart_item_params
     params.require(:cart_item).permit(:quantity)
   end
end
