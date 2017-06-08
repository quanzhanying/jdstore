class ProductsController < ApplicationController

  before_action :validate_search_key, only: [:search]
  before_action :validate_search_key1, only: [:search1]
  before_action :validate_search_key2, only: [:search2]
  before_action :validate_search_key3, only: [:search3]

  before_action :authenticate_user! , only: [:like, :unlike]

  def index
    @products = Product.all.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
    @recommends = Product.where("keyword LIKE ?", "%热销%").order("position ASC").paginate(:page => params[:page], :per_page => 7)
  end

  def add_to_cart
    @product = Product.find(params[:id])
    # current_cart.add_product_to_cart(@product)
    # redirect_to :back
    # flash[:notice] = "测试加入购物车"
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      # flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已成功将 #{@product.name} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end

  # def favorite
  #   @product = Product.find(params[:id])
  #   type = params[:type]
  #   if type == "favorite"
  #     current_user.favorite_products << @product
  #   elsif type == "unfavorite"
  #     current_user.favorite_products.delete(@product)
  #   end
  #   redirect_to :back
  # end

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

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 20 )
    end
  end

  def search1
    if @query_string1.present?
      search_result = Product.ransack(@search_criteria1).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 20 )
    end
  end

  def search2
    if @query_string2.present?
      search_result = Product.ransack(@search_criteria2).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 20 )
    end
  end

  def search3
    if @query_string3.present?
      search_result = Product.ransack(@search_criteria3).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 20 )
    end
  end

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def validate_search_key1
    @query_string1 = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria1 = search_criteria1(@query_string1)
  end

  def validate_search_key2
    @query_string2 = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria2 = search_criteria2(@query_string2)
  end

  def validate_search_key3
    @query_string3 = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria3 = search_criteria3(@query_string3)
  end

  def search_criteria(query_string)
    { :name_or_category1_or_category2_or_category3_or_keyword_or_location_cont => query_string }
  end

  def search_criteria1(query_string1)
    { :category1_cont => query_string1 }
  end

  def search_criteria2(query_string2)
    { :category2_cont => query_string2 }
  end

  def search_criteria3(query_string3)
    { :category3_cont => query_string3 }
  end

  private

end
