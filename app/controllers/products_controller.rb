class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :show]
  before_action :validate_search_key, only: [:search]
  def index
    if params[:category].blank?
      @products = Product.selling
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
    end
  end

  def show
    @product = Product.find(params[:id])
    if @product.can_sell = false
      redirect_to root_path
    end
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

  # 收藏商品的method
  def add_to_favorite
    @product = Product.find(params[:id])
    @product.fans << current_user
    @product.save
    redirect_to :back, notice:"成功加入收藏!"
  end
  # 收藏商品method结束

  # 取消收藏的method
  def cancel_favorite
    @product = Product.find(params[:id])
    @product.fans.delete(current_user)
    @product.save
    redirect_to :back, alert: "成功取消收藏!"
  end
  # 取消收藏的method结束

  # 增加点赞功能
  def upvote
    @product = Product.find(params[:id])
    @product.upvote_by current_user
    redirect_to :back
  end
  # 点赞功能代码结束

  # 添加搜索功能
  def search
    if @query_string.present?
      search_result = Product.selling.ransack(@search_criteria).result(:distinct => true) #只搜索销售中的商品
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :name_cont => query_string }
  end
  # 搜索功能代码结束

  private
  def product_params
    params.require(:product).permit(:name, :description, :stock, :price, :can_sell, :image, :category_id)
  end
end
