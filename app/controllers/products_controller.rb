class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
  if @product.update(product_params)
    redirect_to products_path
  else
    render :edit
  end
end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

def add_to_cart
  @product = Product.find(params[:id])

 if @product.quantity == 0
   flash[:alert] = "Sorry, product quantity less than one"
 end

 if current_cart.products.include?(@product)
   flash[:alert] = "this products already in cart"
 else
  current_cart.add_product_to_cart(@product)
  redirect_to :back
end

end


  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
