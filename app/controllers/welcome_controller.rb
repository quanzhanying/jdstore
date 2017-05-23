class WelcomeController < ApplicationController
  # def index
  #   flash[:notice] = "Notice!"
  #   flash[:alert] = "Alert!"
  #   flash[:warning] = "Warning!"
  # end

  def index
    @products = Product.all.order("position ASC").paginate(:page => params[:page], :per_page => 8)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.name} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

end
