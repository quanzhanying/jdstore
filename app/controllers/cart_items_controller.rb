class CartItemsController < ApplicationController

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to :back
  end

  def up_cart_item
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity  < @cart_item.product.quantity
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to :back
  else
    flash[:warning] = "都让你要了！！"
    redirect_to :back
  end
  end

  def down_cart_item
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity -= 1
    if @cart_item.quantity < 1
    else
    @cart_item.save
  end
    redirect_to :back
  end


    def update

      @cart = current_cart
      @cart_item =@cart.cart_items.find_by(product_id: params[:id])

      if quantity_params[:quantity].to_i > 0

        if @cart_item.product.quantity >= quantity_params[:quantity].to_i
           @cart_item.update(quantity_params)
           flash[:notice]="客官不在加一个吗？Y(^o^)Y"
        else
            flash[:warning]="赶快买了吧！快没货啦XD"
        end
     else
       flash[:warning]="不买滚犊子！"
     end
       redirect_to carts_path

     end

    private
    def quantity_params
     params.require(:cart_item).permit(:quantity)
    end

end
