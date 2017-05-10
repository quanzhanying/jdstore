class CartsController < ApplicationController
  def index
    @cart = current_cart
  end

  def clear
    current_cart.clear_cart
    current_cart.save
    flash[:notice] = "已清空购物车"
    redirect_to :back
  end

  def remove_product
    @product = Product.find(params[:id])
    if !@product.blank?
      flash[:notice] = "商品已从购物车拿掉"
      quantity = current_cart.get_quantity(@product)
      current_cart.remove_product(@product)
      @product.quantity += quantity
      @product.save
      redirect_to :back
    else
      flash[:warning] = "商品已下架"
    end
  end

  def increase_product
    @product = Product.find(params[:id])
    if !@product.blank?
      if @product.quantity > 0
        if current_cart.increase_product(@product)
          @product.quantity = @product.quantity - 1
          @product.save
          flash[:notice] = "成功增加一个商品"
        else
          flash[:notice] = "增加一个商品失败"
        end

      else
        flash[:warning] = "商品库存不够，请一会再来"
      end
    else
      flash[:warning] = "商品已下架"
    end
    redirect_to :back
  end

  def decrease_product
    @product = Product.find(params[:id])
    if !@product.blank?
       if current_cart.decrease_product(@product)
         @product.quantity = @product.quantity + 1;
         @product.save
         flash[:notice] = "成功减少一个商品"
       else
         flash[:notice] = "减少一个商品失败"
       end

    else
      flash[:warning] = "商品已下架"
    end
    redirect_to :back
  end

end
