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
        redirect_to :back,alert: "The product has no quantity,Please select others!"
      else
        @product.quantity = @product.quantity - 1
        if @product.save
          current_cart.add_product_to_cart(@product)
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
