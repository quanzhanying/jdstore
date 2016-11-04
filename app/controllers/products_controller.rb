class ProductsController < ApplicationController

  def index
    @products = Product.publish.recent
  end

  def show
    @product =Product.find(params[:id])

    if @product.is_hidden
      flash[:warning] = "This product has been archieved."
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    current_cart.add_product_to_cart(@product)
    redirect_to :back


    # @product = Product.find(params[:id])
    # @cart = current_cart
    # # @cart_item = CartItem.where( :cart_id => @cart.id)
    # #  @cart_item.each do |d|
    # #   # if d.product_id.count > 1
    # #   #   # @cart_item.quantity += 1
    # #   #
    # #   # else
    # #   #   current_cart.add_product_to_cart(@product)
    # #   #     redirect_to carts_path
    # #   # end
    # # # end
    # #   puts "********"#d.product_id.count
    # end
    # redirect_to carts_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end

end
