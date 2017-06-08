class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "已清空购物车"
    redirect_to carts_path
  end

  def checkout
   if current_cart.cart_items.blank?
     flash[:alert] = "购物车为空！"
     redirect_to :back
   else
     @addresses = current_user.addresses.order("updated_at desc")
     @order = Order.new
   end
  end

  def index
    @carts = current_cart.cart_items.order("id") #.where( "id > ?", params[:max_id])
    @max_id =  params[:max_id].to_i
    respond_to do |format|
      format.html  # 如果客户端要求 HTML，则回传 index.html.erb
      format.js    # 如果客户端要求 JavaScript，回传 index.js.erb
      #render :js => ""
    end
  end


end
