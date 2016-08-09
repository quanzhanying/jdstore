class CartsController < ApplicationController
  def destroy
    @cart_items=CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to :back
  end

  def empty_cart
    current_cart.cart_items.destroy_all
    # current_cart.destroy
    redirect_to :back
  end

  def up

    @cart_item = CartItem.find(params[:id])
    @product=@cart_item.product

    if @cart_item.quantity < @product.quantity
      @cart_item.quantity=@cart_item.quantity+1
    else
      flash[:alert]="库存不够了哦！"
    end
    @cart_item.save
    redirect_to :back
  end

  def down
    @cart_item=CartItem.find(params[:id])
    @cart_item.quantity=@cart_item.quantity-1
    @cart_item.save
    redirect_to :back
  end

  def up2
    @product = Product.find(params[:id])
    #flash[:notice] = current_cart.id
    @cart_item = CartItem.find_by(product_id: @product.id,cart_id: current_cart.id)

    @cart_item.quantity =  @cart_item.quantity + 1

    @cart_item.save

    flash[:notice] = "Add to cart successfully"
    redirect_to :back
  end

  # def checkout
  #   @order = Order.new
  # end


end
