class ProductsController < ApplicationController
  before_action :check_if_product_in_cart, only: [:add_to_cart]
  def index
    @products = Product.where(:onsale => true)
  end

  def show
    @product = Product.find(params[:id])

    if @product.onsale == false
      flash[:warning] = "This product is sold out."
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end


  def add_to_cart
    @product = Product.find(params[:id])
    # current_cart.cart_items.each do |cart_item|
    #   if @product == @cart_item
    #     break
    #     flash[:warning] = "This product is already in your cart, click button to change quantity."
    #   end
    # end

    # for product in current_cart.cart_items
    #   while product == @product
    #     break
    #     flash[:warning] = "This product is already in your cart, click button to change quantity."
    #   end
    # end
    # if current_cart.cart_items.products.include?(@product)
    #   flash[:warning] = "This product is already in your cart, click button to change quantity."
    # end

    if @product.quantity > 0
      current_cart.add_product_to_cart(@product)
      return redirect_to carts_path
    else
      flash[:warning] = "This product is sold out. Check out something else."
      return redirect_to root_path
    end
  end


    # if @product.quantity > 0
    #   current_cart.add_product_to_cart(@product)
    # else
    #   flash[:warning] = "This product is sold out."
    # end
    # redirect_to carts_path



  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :onsale, :image)
  end

  # def check_if_product_in_stock
  #   if @product.quantity == 0
  #     redirect_to carts_path
  #     flash[:warning] = "This product is sold out."
  #   end
  # end

  def check_if_product_in_cart
    @product = Product.find(params[:id])
    current_cart.cart_items.each do |cart_item|
      if cart_item.product == @product
        flash[:warning] = "This product is already in your cart, click button to change quantity."
        return redirect_to carts_path
      end
    end
  end

end
