class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user! , only: [:like, :unlike]

  def index
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
    end
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    flash[:notice] = "成功加入购物车"
    else
      flash[:warning] = "你的购物车内已有此产品"
    end
      redirect_to :back
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.order('created_at DESC')
    end
  end

  def like
    @product = Product.find(params[:id])
    if !current_user.is_like?(@product)
        current_user.like!(@product)
        flash[:notice] = "收藏商品成功！"
     else
        flash[:warning] = "你已经收藏过本商品了！"
     end
      redirect_to product_path(@product)
  end

  def unlike
    @product = Product.find(params[:id])
    if current_user.is_like?(@product)
        current_user.unlike!(@product)
        flash[:notice] = "取消收藏商品！"
     else
        flash[:warning] = "你没有收藏过商品，如何取消 XD！"
     end
      redirect_to product_path(@product)
  end

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

end
