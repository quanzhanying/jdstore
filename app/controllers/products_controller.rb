class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if current_cart.products.include?(@product)
      # 当前购物车在models/Cart里 has_many :products, through: :cart_items, source: :product
      # througt: :cart_items 让cart从catr_items得到没每个product的情况。
      # 后面的（@product）是第一行当前id的product @product ＝ Product.dind(params[:id])
      # include说明：http://guides.rubyonrails.org/active_record_querying.html
      flash[:alert] = "您选择的商品已经加入了购物车。"
    else
      current_cart.add_product_to_cart(@product)
    end
    redirect_to :back
  end

  # def in_the_cart
  #   @product = Product.find(params[:id])
  #   product_id = @product
  #   if current_cart.product_id.present?
  #     redirect_to :back
  #   end
  # end
end
