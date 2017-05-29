class ProductsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  before_action :validate_search_key, only: [:search]
  layout "products"
  def index
    # 商品列表排序功能和不同种类分类显示功能
    if params[:category].blank? && params[:brand].blank?
      @products = case params[:order]
      when 'by_product_stock'
        Product.selling.order('stock DESC').paginate(:page => params[:page], :per_page => 10)
      when 'by_product_price'
        Product.selling.order('price DESC').paginate(:page => params[:page], :per_page => 10)
      else
      @products = Product.selling.recent.paginate(:page => params[:page], :per_page => 10)
      end
    elsif !params[:category].blank? && params[:brand].blank?
      @category_id = Category.find_by(name: params[:category]).id
      @products = case params[:order]
      when 'by_product_stock'
        Product.where(:category_id => @category_id).order('stock DESC').paginate(:page => params[:page], :per_page => 10)
      when 'by_product_price'
        Product.where(:category_id => @category_id).order('price DESC').paginate(:page => params[:page], :per_page => 10)
      else
      @products = Product.where(:category_id => @category_id).recent.paginate(:page => params[:page], :per_page => 10)
      end
    elsif params[:category].blank? && !params[:brand].blank?
      @brand_id = Brand.find_by(name: params[:brand]).id
      @products = case params[:order]
      when 'by_product_stock'
        Product.where(:brand_id => @brand_id).order('stock DESC').paginate(:page => params[:page], :per_page => 10)
      when 'by_product_price'
        Product.where(:brand_id => @brand_id).order('price DESC').paginate(:page => params[:page], :per_page => 10)
      else
      @products = Product.where(:brand_id => @brand_id).recent.paginate(:page => params[:page], :per_page => 10)
      end
    elsif !params[:category].blank? && !params[:brand].blank?
      @category_id = Category.find_by(name: params[:category]).id
      @brand_id = Brand.find_by(name: params[:brand]).id
      @products = case params[:order]
      when 'by_product_stock'
        Product.where(:brand_id => @brand_id, :category_id => @category_id).order('stock DESC').paginate(:page => params[:page], :per_page => 10)
      when 'by_product_price'
        Product.where(:brand_id => @brand_id, :category_id => @category_id).order('price DESC').paginate(:page => params[:page], :per_page => 10)
      else
      @products = Product.where(:brand_id => @brand_id, :category_id => @category_id).recent.paginate(:page => params[:page], :per_page => 10)
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @suggests = Product.selling.random8 #选出4个随机商品
    @photos = @product.photos.all
    @comments = @product.comments.all # 找出所有评论
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
    params.require(:product).permit(:name, :description, :stock, :price, :can_sell, :image, :category_id, :brand_id)
  end
end
