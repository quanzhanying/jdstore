class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :favorite, :unfavorite, :add_to_cart]

  def index
    @suggests = Product.random
    if params[:category].present?
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("position ASC")
    else
      @products = Product.all.order("position ASC")
    end
  end

  def show
    @suggests = Product.random
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save(product_params)
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if product.update(product_params)
      redirect_to products_path, notice: "Update Successful"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to products_path, alert: "Product Deleted"
    end
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
      redirect_to :back
  end

  def instant_buy
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    else
      flash[:warning] = "你的购物车已有此物品，快去结账吧"
    end
    redirect_to carts_path
  end

  def favorite
    @product = Product.find(params[:id])
    current_user.favorite_products << @product
    flash[:notice] = "收藏成功"
    redirect_to :back
  end

  def unfavorite
    @product = Product.find(params[:id])
    current_user.favorite_products.delete(@product)
    flash[:notice] = "已取消收藏"
    redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 15)
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end




end
