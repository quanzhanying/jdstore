class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:like, :unlike]
  def index
    @products = Product.order("position ASC")
  end

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

  def like
    @product = Product.find(params[:id])
    if !current_user.has_liked?(@product)
      current_user.like!(@product)
      flash[:notice] = "谢谢你对我们的认可！"
    else
      flash[:warning] = "你已经给该书点过赞了！"
    end
    redirect_to product_path(@product)
  end

  def unlike
    @product = Product.find(params[:id])
    if current_user.has_liked?(@product)
      current_user.unlike!(@product)
      flash[:alert] = "谢谢反馈，我们会继续努力！"
    else
      flash[:warning] = "你还没有点赞呢！"
    end
    redirect_to product_path(@product)
  end

  def search
     if @query_string.present? && !@query_string.blank?
       search_result = Product.ransack(@search_criteria).result(:distinct => true)
       @products = search_result.paginate(:page => params[:page], :per_page => 8 )
       if @products.blank?
         redirect_to root_path, alert: "没有找到相关工作信息！"
       end
     else
       redirect_to root_path, notice: "搜索信息不能为空，请输入关键字搜索！"
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


end
