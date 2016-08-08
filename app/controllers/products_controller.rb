class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if current_cart.is_seller_of?(@product)
      #current_cart.products.include?(@product)
      flash[:alert] = "不能重复加入购物车"
    else

      if @product.quantity > current_cart.cart_items.count
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "已加入购物车"
      else
        flash[:alert] = "已售罄"
      end
    end

    #flash[:warning] = current_cart.is_seller_of?(@product)

    redirect_to :back
  end


  # def move_from_cart
  #   @product = Product.find(params[:id])
  #     current_cart.move_product_from_cart(@product)
  #     flash[:alert] = "已移出购物车"
  #   redirect_to :back
  # end


end

private
def product_params
  params.require(:product).permit(:title, :description, :quantity, :price, :image)
end
