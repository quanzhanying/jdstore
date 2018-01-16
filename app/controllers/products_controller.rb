class ProductsController < ApplicationController
  before_action :validate_search_key, only:[:search]
  before_action :authenticate_user! , only: [:like, :unlike]


  def index

    #分类显示
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id #先找到category_id

      @products = Product.where(category_id:  @category_id) #再根据category_id找到相对应的产品。
    end
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments
    @suggests = Product.all.random2
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @quantity = params[:quantity].to_i
    if current_cart.products.include?(@product)
      flash[:warning] = "你的购物车内已有此物品"
    else
      # 判断加入购物车的商品是否超过库存
      if @quantity > @product.quantity
        @quantity = @product.quantity
        flash[:warning] = "您选择的商品数量超过库存，实际加入购物车的商品为#{@quantity}件。"
      end
        current_cart.add_product_to_cart(@product, @quantity)
        redirect_to :back
    end
  end

  def search
      if @query_string.present?
        search_result = Product.ransack(@search_criteria).result(:distinct => true)
        @products = search_result
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
         flash[:warning] = "你没有收藏过商品！"
      end
       redirect_to product_path(@product)
   end

  protected
  #去除特殊字符
  def validate_search_key
    @query_string = params[:keyword].gsub(/\\|\'|\/|\?/, "") if params[:keyword].present?
    @search_criteria = search_criteria(@query_string)
  end
  #查询标准（可选多个查询字段）
  def search_criteria(query_string)
    { :title_or_description_cont => query_string }
  end
end
