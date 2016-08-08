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
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  def join
    @product = Product.find(params[:id])

    if !current_user.is_member_of?(@product)
      current_user.join!(@product)
      flash[:notice] = "加入收藏成功!"
    else
      flash[:warning] = "你已经收藏成功了！"
    end

    redirect_to product_path(@product)
  end

  def quit
    @product = Product.find(params[:id])
    if current_user.is_member_of?(@product)
      current_user.quit!(@product)
      flash[:alert] = "你已经取消收藏！"
    else
      flash[:warning] = "你没有收藏！"
    end

    redirect_to product_path(@product)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if @product.quantity > 0
    current_cart.add_product_to_cart(@product)
    flash[:notice] = "已加入购物车"
    redirect_to :back
    else
    flash[:alert] = "The product is sold out"
    redirect_to :back
    end
  end



  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end

end
