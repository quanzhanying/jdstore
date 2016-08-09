class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
      if @product.quantity == 0
        redirect_to :back, alert: "The product has no quantity,Please select others!"
      else
        #如果有库存，那么加入购物车
        @product.quantity = @product.quantity - 1
        if @product.save
          flag = 0
          #判断
          current_cart.products.each do |product|

            if product.id == @product.id
              flag = 1
              @cart_item = CartItem.find_by(cart_id: current_cart.id,product_id: product.id)
              @cart_item.quantity = @cart_item.quantity + 1
              @cart_item.save
            end
          end
          if flag == 0
            current_cart.add_product_to_cart(@product)
          end
        else
          redirect_to :back , alert: "Failed to add product to cart"
        end
        redirect_to :back , alert: "Success to add product to cart"
      end

  end

  private

  def product_params
    params.require(:product).permit(:title, :description , :quantity, :image , :price )

  end
end
