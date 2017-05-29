class CartItemsController < ApplicationController
  #before_action :authenticate_user!


  def destroy

    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.nil?
      jq = '$(".cart-item-' + params[:id].to_s + '").remove();' +
      '$(".cw-icon span").html("' + current_cart.cart_items.sum("quantity").to_s + '" );' +
      '$("#cart_items span").html("(' + current_cart.cart_items.sum("quantity").to_s + ')" );'
      render :js =>  jq
    else
      @product = @cart_item.product
      @cart_item.destroy
      sum = 0
      @cart.cart_items.each do |cart_item|
        if cart_item.product.promotional.present?
          sum += cart_item.quantity * cart_item.product.promotional
        end
      end
      jq = '$(".cart-item-' + params[:id].to_s + '").remove();' +
      '$(".cw-icon span").html("' + current_cart.cart_items.sum("quantity").to_s + '" );' +
      '$("#cart_items span").html("(' + current_cart.cart_items.sum("quantity").to_s + ')" );' +
      '$(".product-price-totle").html("总计：' + sum.to_s + ' RMB" );'
      render :js =>  jq
    end

    #flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
    #redirect_to :back
  end

def up
  if  !params[:value].blank?
    @product = Product.find(params[:cart_item_id])
    @cart = current_cart
    num = params[:value].to_i
    ci = @cart.cart_items.find_by(product_id: @product)
      if  num > 0 and num <= @product.quantity
          ci.quantity = num
          ci.save
      elsif num > @product.quantity
          ci.quantity = @product.quantity
          ci.save
      end
      sum = 0
      quantity = 0
      @cart.cart_items.each do |cart_item|
        if cart_item.product.promotional.present?
          sum += cart_item.quantity * cart_item.product.promotional
          quantity += cart_item.quantity
        end
      end
      jq ='$(".cw-icon span").html("' + quantity.to_s + '" );' +
      '$(".cart-item-' + params[:cart_item_id].to_s + ' .quantity-price").html("' + (@product.promotional * ci.quantity).to_s + ' RMB" );' +
      '$(".product-price-totle").html("总计：' + sum.to_s + ' RMB" );'
      render :js =>  jq
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

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
