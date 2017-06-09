class ProductsController < ApplicationController

  layout "navbarview"
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user! , only: [:like, :unlike]

  def index
   @products = Product.all.order("position ASC")
   @products = @products.paginate(:page => params[:page], :per_page=> 10)
 end

 def show
   @product = Product.find(params[:id])
 end

 def add_to_cart
   @product = Product.find(params[:id])
   if !current_cart.products.include?(@product)
     current_cart.add_product_to_cart(@product)
     flash[:notice] = "你已成功将 #{ @product.title } 加入购物车"
   else
     flash[:warning] = "你的购物车内已有此物品"
   end
   redirect_to :back
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


 def search
   if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
 end

 protected

   def validate_search_key
     @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
     @search_criteria = search_criteria(@query_string)
   end


   def search_criteria(query_string)
     { title_or_description_cont: query_string }
   end
   #搜索哪些栏位，目前只有title和description

 private
   def product_params
     params.require(:product).permit(:title, :description, :price, :quantity, :image, :author)
   end

end
